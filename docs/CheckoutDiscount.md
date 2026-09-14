# MaytesApiClient::CheckoutDiscount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  |  |
| **description** | **String** |  | [optional] |
| **scope** | **String** |  |  |
| **amount** | **Integer** |  |  |
| **currency** | **String** |  |  |
| **metadata** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **applies_to** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CheckoutDiscount.new(
  name: null,
  description: null,
  scope: null,
  amount: null,
  currency: null,
  metadata: null,
  applies_to: null
)
```

