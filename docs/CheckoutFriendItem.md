# MaytesApiClient::CheckoutFriendItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **item_ref** | **String** |  |  |
| **quantity** | **Integer** | How many units of this line this friend pays for. Omit for the whole line. | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CheckoutFriendItem.new(
  item_ref: null,
  quantity: null
)
```

