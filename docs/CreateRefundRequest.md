# MaytesApiClient::CreateRefundRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reason** | **String** | Free-text reason; forwarded to Stripe as refund metadata. | [optional] |
| **merchant_refund_ref** | **String** | Idempotency key scoped to the merchant. Repeating the same value returns the existing refund. |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CreateRefundRequest.new(
  reason: null,
  merchant_refund_ref: null
)
```

