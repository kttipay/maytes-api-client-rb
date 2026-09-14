# MaytesApiClient::CheckoutFee

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  |  |
| **description** | **String** |  | [optional] |
| **fee_type** | **String** |  | [optional] |
| **scope** | **String** |  |  |
| **amount** | **Integer** |  |  |
| **currency** | **String** |  |  |
| **metadata** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **applies_to** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CheckoutFee.new(
  name: null,
  description: null,
  fee_type: null,
  scope: null,
  amount: null,
  currency: null,
  metadata: null,
  applies_to: null
)
```

