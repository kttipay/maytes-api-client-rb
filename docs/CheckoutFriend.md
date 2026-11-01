# MaytesApiClient::CheckoutFriend

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  |  |
| **mobile** | **String** | E.164, e.g. +61412345678 |  |
| **email** | **String** |  | [optional] |
| **amount** | **Integer** | This friend’s share in minor units. Give it for every friend or for none. | [optional] |
| **items** | [**Array&lt;CheckoutFriendItem&gt;**](CheckoutFriendItem.md) | The cart lines this friend pays for (item_assignment only). Give it for every friend or for none. | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CheckoutFriend.new(
  name: null,
  mobile: null,
  email: null,
  amount: null,
  items: null
)
```

