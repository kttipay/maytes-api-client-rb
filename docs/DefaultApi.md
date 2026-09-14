# MaytesApiClient::DefaultApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**cancel_checkout**](DefaultApi.md#cancel_checkout) | **POST** /api/merchant/v1/checkouts/{checkoutUuid}/cancel | Cancel authorized checkout |
| [**capture_checkout**](DefaultApi.md#capture_checkout) | **POST** /api/merchant/v1/checkouts/{checkoutUuid}/capture | Capture authorized checkout |
| [**create_checkout**](DefaultApi.md#create_checkout) | **POST** /api/merchant/v1/checkouts | Create a new checkout |
| [**get_checkout**](DefaultApi.md#get_checkout) | **GET** /api/merchant/v1/checkouts/{checkoutUuid} | Get checkout details |
| [**get_health**](DefaultApi.md#get_health) | **GET** /api/health | Health check |
| [**get_o_auth_token**](DefaultApi.md#get_o_auth_token) | **POST** /oauth/token | Issue an access token |
| [**get_settlement**](DefaultApi.md#get_settlement) | **GET** /api/merchant/v1/settlements/{uuid} | Get a settlement by UUID |
| [**list_settlements**](DefaultApi.md#list_settlements) | **GET** /api/merchant/v1/settlements | List settlements for this merchant |
| [**refund_checkout**](DefaultApi.md#refund_checkout) | **POST** /api/merchant/v1/checkouts/{checkoutUuid}/refund | Refund a captured checkout |


## cancel_checkout

> <CancelCheckoutResponse> cancel_checkout(checkout_uuid, cancel_checkout_request)

Cancel authorized checkout

### Examples

```ruby
require 'time'
require 'maytes_api_client'
# setup authorization
MaytesApiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = MaytesApiClient::DefaultApi.new
checkout_uuid = 'checkout_uuid_example' # String | 
cancel_checkout_request = MaytesApiClient::CancelCheckoutRequest.new # CancelCheckoutRequest | 

begin
  # Cancel authorized checkout
  result = api_instance.cancel_checkout(checkout_uuid, cancel_checkout_request)
  p result
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->cancel_checkout: #{e}"
end
```

#### Using the cancel_checkout_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CancelCheckoutResponse>, Integer, Hash)> cancel_checkout_with_http_info(checkout_uuid, cancel_checkout_request)

```ruby
begin
  # Cancel authorized checkout
  data, status_code, headers = api_instance.cancel_checkout_with_http_info(checkout_uuid, cancel_checkout_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CancelCheckoutResponse>
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->cancel_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **checkout_uuid** | **String** |  |  |
| **cancel_checkout_request** | [**CancelCheckoutRequest**](CancelCheckoutRequest.md) |  |  |

### Return type

[**CancelCheckoutResponse**](CancelCheckoutResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## capture_checkout

> <CaptureCheckoutResponse> capture_checkout(checkout_uuid, capture_checkout_request)

Capture authorized checkout

### Examples

```ruby
require 'time'
require 'maytes_api_client'
# setup authorization
MaytesApiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = MaytesApiClient::DefaultApi.new
checkout_uuid = 'checkout_uuid_example' # String | 
capture_checkout_request = MaytesApiClient::CaptureCheckoutRequest.new # CaptureCheckoutRequest | 

begin
  # Capture authorized checkout
  result = api_instance.capture_checkout(checkout_uuid, capture_checkout_request)
  p result
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->capture_checkout: #{e}"
end
```

#### Using the capture_checkout_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CaptureCheckoutResponse>, Integer, Hash)> capture_checkout_with_http_info(checkout_uuid, capture_checkout_request)

```ruby
begin
  # Capture authorized checkout
  data, status_code, headers = api_instance.capture_checkout_with_http_info(checkout_uuid, capture_checkout_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CaptureCheckoutResponse>
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->capture_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **checkout_uuid** | **String** |  |  |
| **capture_checkout_request** | [**CaptureCheckoutRequest**](CaptureCheckoutRequest.md) |  |  |

### Return type

[**CaptureCheckoutResponse**](CaptureCheckoutResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_checkout

> <CreateCheckoutResponse> create_checkout(create_checkout_request)

Create a new checkout

### Examples

```ruby
require 'time'
require 'maytes_api_client'
# setup authorization
MaytesApiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = MaytesApiClient::DefaultApi.new
create_checkout_request = MaytesApiClient::CreateCheckoutRequest.new({total_amount: 37, currency: 'currency_example', return_url: 'return_url_example', cancel_url: 'cancel_url_example', items: [MaytesApiClient::DigitalGoodsLineItem.new({item_ref: 'item_ref_example', name: 'name_example', quantity: 37, unit_price: 37, currency: 'currency_example', category: 'digital_goods'})]}) # CreateCheckoutRequest | 

begin
  # Create a new checkout
  result = api_instance.create_checkout(create_checkout_request)
  p result
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->create_checkout: #{e}"
end
```

#### Using the create_checkout_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateCheckoutResponse>, Integer, Hash)> create_checkout_with_http_info(create_checkout_request)

```ruby
begin
  # Create a new checkout
  data, status_code, headers = api_instance.create_checkout_with_http_info(create_checkout_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateCheckoutResponse>
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->create_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_checkout_request** | [**CreateCheckoutRequest**](CreateCheckoutRequest.md) |  |  |

### Return type

[**CreateCheckoutResponse**](CreateCheckoutResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_checkout

> <GetCheckoutResponse> get_checkout(checkout_uuid, opts)

Get checkout details

### Examples

```ruby
require 'time'
require 'maytes_api_client'
# setup authorization
MaytesApiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = MaytesApiClient::DefaultApi.new
checkout_uuid = 'checkout_uuid_example' # String | 
opts = {
  merchant_order_id: 'merchant_order_id_example' # String | 
}

begin
  # Get checkout details
  result = api_instance.get_checkout(checkout_uuid, opts)
  p result
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->get_checkout: #{e}"
end
```

#### Using the get_checkout_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetCheckoutResponse>, Integer, Hash)> get_checkout_with_http_info(checkout_uuid, opts)

```ruby
begin
  # Get checkout details
  data, status_code, headers = api_instance.get_checkout_with_http_info(checkout_uuid, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetCheckoutResponse>
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->get_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **checkout_uuid** | **String** |  |  |
| **merchant_order_id** | **String** |  | [optional] |

### Return type

[**GetCheckoutResponse**](GetCheckoutResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_health

> <HealthResponse> get_health

Health check

### Examples

```ruby
require 'time'
require 'maytes_api_client'

api_instance = MaytesApiClient::DefaultApi.new

begin
  # Health check
  result = api_instance.get_health
  p result
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->get_health: #{e}"
end
```

#### Using the get_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<HealthResponse>, Integer, Hash)> get_health_with_http_info

```ruby
begin
  # Health check
  data, status_code, headers = api_instance.get_health_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <HealthResponse>
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->get_health_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**HealthResponse**](HealthResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_o_auth_token

> <OAuthTokenResponse> get_o_auth_token(o_auth_token_request)

Issue an access token

### Examples

```ruby
require 'time'
require 'maytes_api_client'

api_instance = MaytesApiClient::DefaultApi.new
o_auth_token_request = MaytesApiClient::OAuthTokenRequest.new({grant_type: 'grant_type_example', client_id: 'client_id_example'}) # OAuthTokenRequest | 

begin
  # Issue an access token
  result = api_instance.get_o_auth_token(o_auth_token_request)
  p result
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->get_o_auth_token: #{e}"
end
```

#### Using the get_o_auth_token_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OAuthTokenResponse>, Integer, Hash)> get_o_auth_token_with_http_info(o_auth_token_request)

```ruby
begin
  # Issue an access token
  data, status_code, headers = api_instance.get_o_auth_token_with_http_info(o_auth_token_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OAuthTokenResponse>
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->get_o_auth_token_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **o_auth_token_request** | [**OAuthTokenRequest**](OAuthTokenRequest.md) |  |  |

### Return type

[**OAuthTokenResponse**](OAuthTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_settlement

> <GetSettlementResponse> get_settlement(uuid)

Get a settlement by UUID

### Examples

```ruby
require 'time'
require 'maytes_api_client'
# setup authorization
MaytesApiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = MaytesApiClient::DefaultApi.new
uuid = 'uuid_example' # String | Settlement UUID

begin
  # Get a settlement by UUID
  result = api_instance.get_settlement(uuid)
  p result
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->get_settlement: #{e}"
end
```

#### Using the get_settlement_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetSettlementResponse>, Integer, Hash)> get_settlement_with_http_info(uuid)

```ruby
begin
  # Get a settlement by UUID
  data, status_code, headers = api_instance.get_settlement_with_http_info(uuid)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetSettlementResponse>
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->get_settlement_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uuid** | **String** | Settlement UUID |  |

### Return type

[**GetSettlementResponse**](GetSettlementResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_settlements

> <ListSettlementsResponse> list_settlements(opts)

List settlements for this merchant

Returns settlements for the authenticated merchant. Default sort: created_at ASC.

### Examples

```ruby
require 'time'
require 'maytes_api_client'
# setup authorization
MaytesApiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = MaytesApiClient::DefaultApi.new
opts = {
  offset: TODO, # Object | Pagination offset (default 0)
  limit: TODO, # Object | Max records to return (default 50, max 200)
  sort_dir: 'asc', # String | Sort direction (default: asc)
  sort_by: 'created_at', # String | Field to sort by (default: created_at)
  created_before: TODO, # Object | Include settlements created at or before this ISO-8601 timestamp
  created_after: TODO, # Object | Include settlements created at or after this ISO-8601 timestamp
  status: 'CREATED' # String | Filter by status
}

begin
  # List settlements for this merchant
  result = api_instance.list_settlements(opts)
  p result
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->list_settlements: #{e}"
end
```

#### Using the list_settlements_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListSettlementsResponse>, Integer, Hash)> list_settlements_with_http_info(opts)

```ruby
begin
  # List settlements for this merchant
  data, status_code, headers = api_instance.list_settlements_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListSettlementsResponse>
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->list_settlements_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **offset** | [**Object**](.md) | Pagination offset (default 0) | [optional] |
| **limit** | [**Object**](.md) | Max records to return (default 50, max 200) | [optional] |
| **sort_dir** | **String** | Sort direction (default: asc) | [optional] |
| **sort_by** | **String** | Field to sort by (default: created_at) | [optional] |
| **created_before** | [**Object**](.md) | Include settlements created at or before this ISO-8601 timestamp | [optional] |
| **created_after** | [**Object**](.md) | Include settlements created at or after this ISO-8601 timestamp | [optional] |
| **status** | **String** | Filter by status | [optional] |

### Return type

[**ListSettlementsResponse**](ListSettlementsResponse.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## refund_checkout

> refund_checkout(checkout_uuid, create_refund_request)

Refund a captured checkout

Initiates a full refund of the captured payment. Returns 204 immediately; Stripe confirms asynchronously via webhook. Poll GET /checkouts/:uuid for status and refund details.

### Examples

```ruby
require 'time'
require 'maytes_api_client'
# setup authorization
MaytesApiClient.configure do |config|
  # Configure Bearer authorization (JWT): bearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = MaytesApiClient::DefaultApi.new
checkout_uuid = 'checkout_uuid_example' # String | 
create_refund_request = MaytesApiClient::CreateRefundRequest.new({merchant_refund_ref: 'merchant_refund_ref_example'}) # CreateRefundRequest | 

begin
  # Refund a captured checkout
  api_instance.refund_checkout(checkout_uuid, create_refund_request)
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->refund_checkout: #{e}"
end
```

#### Using the refund_checkout_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> refund_checkout_with_http_info(checkout_uuid, create_refund_request)

```ruby
begin
  # Refund a captured checkout
  data, status_code, headers = api_instance.refund_checkout_with_http_info(checkout_uuid, create_refund_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue MaytesApiClient::ApiError => e
  puts "Error when calling DefaultApi->refund_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **checkout_uuid** | **String** |  |  |
| **create_refund_request** | [**CreateRefundRequest**](CreateRefundRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

