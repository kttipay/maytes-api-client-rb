# frozen_string_literal: true
#
# Bundled with the generated SDK via bin/postprocess-ruby.sh.
#
# Lives at build/ruby-client/lib/maytes_api_client/managed_client.rb after
# `make generate-ruby`. Required from the gem's root file so consumers do:
#
#   require 'maytes_api_client'
#   api = MaytesApiClient.create_maytes_api_client(
#     endpoint: 'https://api.maytes.co',
#     client_id: '...',
#     client_secret: '...',
#   )
#
# Adds OAuth2 client_credentials credential management on top of the raw
# DefaultApi using a **reactive 401-retry** pattern:
#
#   1. First authed call mints a token via GetOAuthToken (a @auth([]) op) and
#      caches it.
#   2. Subsequent calls send the cached token as-is — no client-side expiry
#      math, no proactive refresh.
#   3. If the server returns 401, ManagedApiClient catches the ApiError,
#      refreshes the token, and retries the call once. The retried request
#      reads the freshly-cached token via ManagedConfiguration#access_token.
#
# Concurrent 401s deduplicate via refresh_if_stale(stale_token): only the first
# thread to acquire the Mutex mints; others see the cache already updated and
# use that token.

require 'uri'

module MaytesApiClient
  class OAuthTokenProvider
    attr_reader :token

    def initialize(endpoint, client_id, client_secret, initial_token = nil)
      @endpoint = endpoint
      @client_id = client_id
      @client_secret = client_secret
      @token = initial_token
      @mutex = Mutex.new

      unauthed_config = Configuration.new
      # Configuration#host= strips the scheme and any trailing path, so passing
      # the full endpoint correctly gives "host:port". Using URI(endpoint).host
      # would drop the port and silently route to :80.
      unauthed_config.host = endpoint
      unauthed_config.scheme = URI(endpoint).scheme
      @unauthed_api = DefaultApi.new(ApiClient.new(unauthed_config))
    end

    def get
      return @token if @token

      @mutex.synchronize do
        return @token if @token

        mint_locked
      end
    end

    # Refresh only if the cache still holds the stale token observed by the
    # caller. If another thread refreshed first, returns that newer token —
    # no second mint.
    def refresh_if_stale(stale_token)
      @mutex.synchronize do
        return @token if @token && @token != stale_token

        mint_locked
      end
    end

    private

    def mint_locked
      payload = OAuthTokenRequest.new(
        grant_type: 'client_credentials',
        client_id: @client_id,
        client_secret: @client_secret,
      )
      response = @unauthed_api.get_o_auth_token(payload)
      @token = response.access_token
    end
  end

  # Configuration whose access_token always delegates to the provider.
  # Internal — merchants should use MaytesApiClient.create_maytes_api_client.
  class ManagedConfiguration < Configuration
    def initialize(provider, endpoint)
      super()
      # See OAuthTokenProvider#initialize for why host=endpoint (not uri.host).
      self.host = endpoint
      self.scheme = URI(endpoint).scheme
      @provider = provider
    end

    def access_token
      @provider.get
    end
  end

  # ApiClient that intercepts 401 responses (raised as ApiError), refreshes the
  # token, and retries the request once. If the retry also 401s, the second
  # ApiError propagates.
  class ManagedApiClient < ApiClient
    def initialize(config, provider)
      super(config)
      @provider = provider
    end

    def call_api(http_method, path, opts = {})
      stale_token = @provider.token
      super
    rescue ApiError => e
      raise unless e.code == 401

      @provider.refresh_if_stale(stale_token)
      super
    end
  end

  # Factory for fully managed Maytes API clients.
  #
  #   api = MaytesApiClient.create_maytes_api_client(
  #     endpoint: 'https://api.maytes.co',
  #     client_id: '...',
  #     client_secret: '...',
  #   )
  #   result = api.create_checkout(body)
  #
  # `initial_token` is an SDK-test-only escape hatch — seeds the cache with a
  # pre-minted JWT. Used by the E2E test path to verify the wrapper's reactive
  # 401-retry refreshes when the seeded token expires. Production callers omit
  # it; the first authed call mints normally via /oauth/token.
  def self.create_maytes_api_client(endpoint:, client_id:, client_secret:, initial_token: nil)
    provider = OAuthTokenProvider.new(endpoint, client_id, client_secret, initial_token)
    config = ManagedConfiguration.new(provider, endpoint)
    DefaultApi.new(ManagedApiClient.new(config, provider))
  end
end
