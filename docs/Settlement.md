# MaytesApiClient::Settlement

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uuid** | **String** |  |  |
| **merchant_uuid** | **String** |  |  |
| **period_from** | **Time** |  |  |
| **period_to** | **Time** |  |  |
| **idempotency_key** | **String** |  |  |
| **merchant_payable_amount** | **Integer** |  |  |
| **settled_amount** | **Integer** |  |  |
| **currency** | **String** |  |  |
| **status** | **String** |  |  |
| **stripe_transfer_id** | **String** |  |  |
| **notes** | **String** |  |  |
| **settled_at** | **Time** |  |  |
| **expires_at** | **Time** |  |  |
| **reviewed_by_user_uuid** | **String** |  |  |
| **reviewed_at** | **Time** |  |  |
| **rejection_reason** | **String** |  |  |
| **created_at** | **Time** |  |  |
| **updated_at** | **Time** |  |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::Settlement.new(
  uuid: null,
  merchant_uuid: null,
  period_from: null,
  period_to: null,
  idempotency_key: null,
  merchant_payable_amount: null,
  settled_amount: null,
  currency: null,
  status: null,
  stripe_transfer_id: null,
  notes: null,
  settled_at: null,
  expires_at: null,
  reviewed_by_user_uuid: null,
  reviewed_at: null,
  rejection_reason: null,
  created_at: null,
  updated_at: null
)
```

