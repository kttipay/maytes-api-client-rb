# MaytesApiClient::DonationLineItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **item_ref** | **String** |  |  |
| **parent_ref** | **String** |  | [optional] |
| **sku** | **String** |  | [optional] |
| **name** | **String** |  |  |
| **description** | **String** |  | [optional] |
| **image_url** | **String** |  | [optional] |
| **quantity** | **Integer** |  |  |
| **unit_price** | **Integer** |  |  |
| **currency** | **String** |  |  |
| **category** | **String** |  |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::DonationLineItem.new(
  item_ref: null,
  parent_ref: null,
  sku: null,
  name: null,
  description: null,
  image_url: null,
  quantity: null,
  unit_price: null,
  currency: null,
  category: null
)
```

