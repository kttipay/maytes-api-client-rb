# MaytesApiClient::CheckoutCaptured

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **checkout_uuid** | **String** |  |  |
| **merchant_order_id** | **String** |  |  |
| **status** | **String** |  |  |
| **captured_at** | **Time** |  |  |
| **amount** | **Integer** |  |  |
| **currency** | **String** |  |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CheckoutCaptured.new(
  checkout_uuid: null,
  merchant_order_id: null,
  status: null,
  captured_at: null,
  amount: null,
  currency: null
)
```

