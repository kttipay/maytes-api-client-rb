# MaytesApiClient::CaptureCheckoutRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_order_id** | **String** |  | [optional] |
| **expected_total_amount** | **Integer** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **metadata** | **Hash&lt;String, Object&gt;** |  | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CaptureCheckoutRequest.new(
  merchant_order_id: null,
  expected_total_amount: null,
  currency: null,
  metadata: null
)
```

