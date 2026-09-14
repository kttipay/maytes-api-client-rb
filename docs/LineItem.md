# MaytesApiClient::LineItem

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'maytes_api_client'

MaytesApiClient::LineItem.openapi_one_of
# =>
# [
#   :'DigitalGoodsLineItem',
#   :'DonationLineItem',
#   :'FoodBeverageLineItem',
#   :'OtherLineItem',
#   :'PhysicalGoodsLineItem',
#   :'ServiceLineItem',
#   :'TicketLineItem'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'maytes_api_client'

MaytesApiClient::LineItem.openapi_discriminator_name
# => :'category'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'maytes_api_client'

MaytesApiClient::LineItem.openapi_discriminator_mapping
# =>
# {
#   :'digital_goods' => :'DigitalGoodsLineItem',
#   :'donation' => :'DonationLineItem',
#   :'food_beverage' => :'FoodBeverageLineItem',
#   :'other' => :'OtherLineItem',
#   :'physical_goods' => :'PhysicalGoodsLineItem',
#   :'service' => :'ServiceLineItem',
#   :'ticket' => :'TicketLineItem'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'maytes_api_client'

MaytesApiClient::LineItem.build(data)
# => #<DigitalGoodsLineItem:0x00007fdd4aab02a0>

MaytesApiClient::LineItem.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `DigitalGoodsLineItem`
- `DonationLineItem`
- `FoodBeverageLineItem`
- `OtherLineItem`
- `PhysicalGoodsLineItem`
- `ServiceLineItem`
- `TicketLineItem`
- `nil` (if no type matches)

