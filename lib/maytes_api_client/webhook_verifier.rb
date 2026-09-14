# frozen_string_literal: true
#
# Bundled with the generated SDK via bin/postprocess-ruby.sh.
#
# Lives at build/ruby-client/lib/maytes_api_client/webhook_verifier.rb after
# `make generate-ruby`. Required from the gem's root file so consumers do:
#
#   require 'maytes_api_client'
#   event = MaytesApiClient.verify_webhook_signature(raw_body, header, secret)
#
# Verifies the `X-Maytes-Signature` header on an inbound webhook delivery and
# returns the parsed event. Merchants must never hand-roll this — see the four
# sharp edges below, each of which silently produces either a security hole or
# an outage:
#
#   1. RAW BODY. The signature covers the exact bytes we sent. Verifying
#      against re-serialised JSON (params.to_json) fails for any body whose key
#      order or number formatting differs after a parse/emit round-trip. This
#      is the single most common webhook integration bug.
#   2. MULTIPLE `v1=` ENTRIES. During a signing-secret rotation grace window
#      the header carries TWO signatures (current secret first, previous
#      second) and the delivery is valid if EITHER matches. A verifier that
#      reads only the first `v1=` works perfectly until the first rotation,
#      then rejects live traffic. See §7 of the webhook spec.
#   3. CONSTANT-TIME COMPARISON. A plain == on digests leaks how much of a
#      forged signature was correct, which is enough to recover a valid
#      signature one byte at a time.
#   4. REPLAY WINDOW. The `t=` timestamp is the anti-replay anchor; a captured
#      delivery stays valid forever without a freshness check.
#
# Verification and JSON parsing are deliberately fused into ONE call: the
# method takes the raw body and hands back the parsed event, so there is no
# intermediate state in which a caller can parse first and verify second.
#
# Algorithm (webhook spec §6.1):
#   signed_payload = "#{t}.#{raw_body}"
#   signature      = lowercase_hex( HMAC_SHA256(signing_secret, signed_payload) )

require 'json'
require 'openssl'

module MaytesApiClient
  # Default anti-replay window, in seconds (webhook spec §6.1 advises ~5 min).
  DEFAULT_WEBHOOK_TOLERANCE_SECONDS = 300

  # Raised when an inbound delivery is not authentic. Respond 400 and do NOT
  # act on the body.
  #
  # `reason` is one of:
  #   :malformed_header           — header absent or missing `t=` / `v1=`
  #   :timestamp_out_of_tolerance — `t=` too far from now; possible replay
  #   :no_matching_signature      — wrong secret, or the body was modified
  #   :invalid_json               — signature valid but body wasn't JSON
  class WebhookSignatureError < StandardError
    attr_reader :reason

    def initialize(reason, message)
      @reason = reason
      super(message)
    end
  end

  # A verified webhook event (webhook spec §6).
  #
  # `data` is left as an open hash because its shape varies per `type` —
  # branch on `type`, then read the fields that event documents. Ignore
  # unrecognised fields: additive changes do NOT bump `api_version`.
  MaytesWebhookEvent = Struct.new(
    :id,          # Stable event id — identical across every retry. Deduplicate on this.
    :type,        # e.g. 'checkout.authorized', 'checkout.voided', 'webhook.test'.
    :api_version, # Envelope schema version, e.g. '2026-06'.
    :created_at,  # When the event occurred.
    :data,        # Per-event payload.
    keyword_init: true,
  )

  # Verify an inbound Maytes webhook delivery and return the parsed event.
  #
  # Pass the **raw** request body — the exact bytes, before any JSON parsing.
  #
  #   post '/webhooks/maytes' do
  #     begin
  #       event = MaytesApiClient.verify_webhook_signature(
  #         request.body.read,                     # raw body
  #         request.env['HTTP_X_MAYTES_SIGNATURE'],
  #         ENV.fetch('MAYTES_WEBHOOK_SECRET'),
  #       )
  #     rescue MaytesApiClient::WebhookSignatureError
  #       halt 400
  #     end
  #     # ... handle event.type
  #     status 200
  #   end
  #
  # `tolerance_seconds: 0` skips the freshness check entirely — TEST ONLY, for
  # replaying a stored delivery in a fixture. Never 0 in production: it makes
  # any captured delivery replayable forever.
  #
  # @raise [WebhookSignatureError] if the delivery is not authentic.
  def self.verify_webhook_signature(
    raw_body,
    signature_header,
    signing_secret,
    tolerance_seconds: DEFAULT_WEBHOOK_TOLERANCE_SECONDS
  )
    timestamp, signatures = parse_webhook_signature_header(signature_header)

    if tolerance_seconds.positive?
      unless timestamp.match?(/\A\d+\z/)
        raise WebhookSignatureError.new(
          :malformed_header,
          'X-Maytes-Signature carries a non-numeric t= value.',
        )
      end
      if (Time.now.to_i - timestamp.to_i).abs > tolerance_seconds
        raise WebhookSignatureError.new(
          :timestamp_out_of_tolerance,
          "Webhook timestamp is outside the #{tolerance_seconds}s tolerance — possible replay.",
        )
      end
    end

    body = raw_body.to_s.dup.force_encoding(Encoding::BINARY)
    expected = OpenSSL::HMAC.hexdigest('SHA256', signing_secret, "#{timestamp}.#{body}")

    # ANY match wins — during a rotation grace window the current secret's
    # signature and the previous secret's signature are both present.
    matched = signatures.any? { |candidate| secure_compare_digest(expected, candidate) }
    unless matched
      raise WebhookSignatureError.new(
        :no_matching_signature,
        'No v1 signature matched the computed HMAC — wrong signing secret, ' \
        'or the body was modified in transit.',
      )
    end

    parse_webhook_envelope(body)
  end

  # @api private
  def self.parse_webhook_signature_header(header)
    if header.nil? || header.strip.empty?
      raise WebhookSignatureError.new(:malformed_header, 'Missing X-Maytes-Signature header.')
    end

    timestamp = nil
    signatures = []

    header.split(',').each do |part|
      trimmed = part.strip
      if trimmed.start_with?('t=')
        timestamp = trimmed[2..]
      elsif trimmed.start_with?('v1=')
        signatures << trimmed[3..]
      end
      # Unknown schemes (a future v2=) are ignored, not fatal — forward
      # compatibility: we may add a scheme alongside v1 before removing v1.
    end

    if timestamp.nil? || timestamp.empty? || signatures.empty?
      raise WebhookSignatureError.new(
        :malformed_header,
        'X-Maytes-Signature is malformed — expected `t=<unix>,v1=<hex>`.',
      )
    end

    [timestamp, signatures]
  end
  private_class_method :parse_webhook_signature_header

  # Length is checked first because fixed_length_secure_compare raises on a
  # length mismatch — and length is not a secret.
  #
  # OpenSSL.fixed_length_secure_compare only exists in the openssl gem >= 2.2
  # (Ruby 3.0+); on older rubies we fall back to an XOR-accumulate loop, which
  # is constant-time for the equal-length inputs the guard above guarantees.
  # Without the fallback this raises NoMethodError on every valid delivery.
  #
  # @api private
  def self.secure_compare_digest(expected, candidate)
    return false unless candidate.is_a?(String) && candidate.bytesize == expected.bytesize

    if OpenSSL.respond_to?(:fixed_length_secure_compare)
      OpenSSL.fixed_length_secure_compare(expected, candidate)
    else
      difference = 0
      expected.bytes.zip(candidate.bytes) { |a, b| difference |= a ^ b }
      difference.zero?
    end
  end
  private_class_method :secure_compare_digest

  # @api private
  def self.parse_webhook_envelope(body)
    parsed = JSON.parse(body.dup.force_encoding(Encoding::UTF_8))
    raise JSON::ParserError, 'not an object' unless parsed.is_a?(Hash)

    MaytesWebhookEvent.new(
      id: parsed['id'].to_s,
      type: parsed['type'].to_s,
      api_version: parsed['api_version'].to_s,
      created_at: parsed['created_at'].to_s,
      data: parsed['data'].is_a?(Hash) ? parsed['data'] : {},
    )
  rescue JSON::ParserError, ArgumentError
    raise WebhookSignatureError.new(
      :invalid_json,
      'Signature verified but the body is not valid JSON.',
    )
  end
  private_class_method :parse_webhook_envelope
end
