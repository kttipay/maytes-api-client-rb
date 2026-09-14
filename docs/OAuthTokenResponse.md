# MaytesApiClient::OAuthTokenResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **access_token** | **String** |  |  |
| **refresh_token** | **String** |  | [optional] |
| **expires_in** | **Float** |  |  |
| **token_type** | **String** |  |  |
| **scope** | **String** |  |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::OAuthTokenResponse.new(
  access_token: null,
  refresh_token: null,
  expires_in: null,
  token_type: null,
  scope: null
)
```

