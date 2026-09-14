# MaytesApiClient::OAuthTokenRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **grant_type** | **String** |  |  |
| **client_id** | **String** |  |  |
| **client_secret** | **String** |  | [optional] |
| **username** | **String** |  | [optional] |
| **password** | **String** |  | [optional] |
| **refresh_token** | **String** |  | [optional] |
| **scope** | **String** |  | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::OAuthTokenRequest.new(
  grant_type: null,
  client_id: null,
  client_secret: null,
  username: null,
  password: null,
  refresh_token: null,
  scope: null
)
```

