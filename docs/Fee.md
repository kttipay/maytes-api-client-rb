# MaytesApiClient::Fee

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **gross** | **Integer** |  |  |
| **discount** | **Integer** |  |  |
| **net** | **Integer** |  |  |
| **breakdown** | [**Array&lt;FeeBreakdownLine&gt;**](FeeBreakdownLine.md) |  |  |

## Example

```ruby
require 'maytes_api_client'

instance = MaytesApiClient::Fee.new(
  gross: null,
  discount: null,
  net: null,
  breakdown: null
)
```

