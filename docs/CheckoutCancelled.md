# MaytesApiClient::CheckoutCancelled

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **checkout_uuid** | **String** |  |  |
| **merchant_order_id** | **String** |  |  |
| **status** | **String** |  |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CheckoutCancelled.new(
  checkout_uuid: null,
  merchant_order_id: null,
  status: null
)
```

