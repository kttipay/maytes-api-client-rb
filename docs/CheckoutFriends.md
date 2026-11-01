# MaytesApiClient::CheckoutFriends

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | How many friends will split, not counting the customer. Give this or &#x60;people&#x60;. | [optional] |
| **people** | [**Array&lt;CheckoutFriend&gt;**](CheckoutFriend.md) | The friends, optionally with their shares. Give this or &#x60;count&#x60;. | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::CheckoutFriends.new(
  count: null,
  people: null
)
```

