# MaytesApiClient::CreateCheckoutRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_order_id** | **String** |  | [optional] |
| **merchant_expires_at** | **Time** |  | [optional] |
| **total_amount** | **Integer** |  |  |
| **currency** | **String** |  |  |
| **return_url** | **String** |  |  |
| **cancel_url** | **String** |  |  |
| **items** | [**Array&lt;LineItem&gt;**](LineItem.md) |  |  |
| **fees** | [**Array&lt;CheckoutFee&gt;**](CheckoutFee.md) |  | [optional] |
| **discounts** | [**Array&lt;CheckoutDiscount&gt;**](CheckoutDiscount.md) |  | [optional] |
| **tax** | [**Tax**](Tax.md) |  | [optional] |
| **shipping_amount** | **Integer** |  | [optional] |
| **customer_data** | [**CustomerData**](CustomerData.md) |  | [optional] |
| **metadata** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **allocation_model** | **String** |  | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CreateCheckoutRequest.new(
  merchant_order_id: null,
  merchant_expires_at: null,
  total_amount: null,
  currency: null,
  return_url: null,
  cancel_url: null,
  items: null,
  fees: null,
  discounts: null,
  tax: null,
  shipping_amount: null,
  customer_data: null,
  metadata: null,
  allocation_model: null
)
```

