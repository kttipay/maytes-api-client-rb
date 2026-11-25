# MaytesApiClient::SettlementUpsell

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sales_amount** | **Integer** | Upsell order totals paid out in this settlement, gross, minor units |  |
| **fee_amount** | **Integer** | Upsell fees kept by Maytes in this window, minor units |  |
| **net_amount** | **Integer** | sales_amount minus fee_amount: the upsell part of the payout |  |
| **order_count** | **Integer** |  |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::SettlementUpsell.new(
  sales_amount: null,
  fee_amount: null,
  net_amount: null,
  order_count: null
)
```

