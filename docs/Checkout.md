# MaytesApiClient::Checkout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **checkout_uuid** | **String** |  |  |
| **merchant_order_id** | **String** |  |  |
| **status** | **String** |  |  |
| **transaction_ref** | **String** |  |  |
| **checkout_url** | **String** |  |  |
| **merchant_expires_at** | **Time** |  |  |
| **captured_at** | **Time** |  |  |
| **return_url** | **String** |  |  |
| **cancel_url** | **String** |  |  |
| **amount** | **Integer** |  |  |
| **currency** | **String** |  |  |
| **service_fee** | [**Fee**](Fee.md) |  |  |
| **refunded_amount** | **Integer** |  |  |
| **merchant_processor_fee** | **Integer** |  |  |
| **merchant_service_fee** | **Integer** |  |  |
| **last_refund_at** | **Time** |  |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::Checkout.new(
  checkout_uuid: null,
  merchant_order_id: null,
  status: null,
  transaction_ref: null,
  checkout_url: null,
  merchant_expires_at: null,
  captured_at: null,
  return_url: null,
  cancel_url: null,
  amount: null,
  currency: null,
  service_fee: null,
  refunded_amount: null,
  merchant_processor_fee: null,
  merchant_service_fee: null,
  last_refund_at: null
)
```

