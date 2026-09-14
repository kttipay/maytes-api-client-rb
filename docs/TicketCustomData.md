# MaytesApiClient::TicketCustomData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_id** | **String** |  |  |
| **event_start_at** | **Time** |  |  |
| **timezone** | **String** |  |  |
| **ticket_class** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **event_end_at** | **Time** |  | [optional] |
| **delivery_mode** | **String** |  | [optional] |
| **venue_name** | **String** |  | [optional] |
| **venue_address** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **seating** | [**TicketSeating**](TicketSeating.md) |  | [optional] |
| **terms_url** | **String** |  | [optional] |
| **attendee_required** | **Boolean** |  | [optional] |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::TicketCustomData.new(
  event_id: null,
  event_start_at: null,
  timezone: null,
  ticket_class: null,
  name: null,
  event_end_at: null,
  delivery_mode: null,
  venue_name: null,
  venue_address: null,
  seating: null,
  terms_url: null,
  attendee_required: null
)
```

