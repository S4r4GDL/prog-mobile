# educadinapi.api.TipControllerApi

## Load the API package
```dart
import 'package:educadinapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getRandomTipByType**](TipControllerApi.md#getrandomtipbytype) | **GET** /v1/tips/{type} | 


# **getRandomTipByType**
> TipDTO getRandomTipByType(type, userId)



### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TipControllerApi();
final type = type_example; // String | 
final userId = 789; // int | 

try {
    final result = api_instance.getRandomTipByType(type, userId);
    print(result);
} catch (e) {
    print('Exception when calling TipControllerApi->getRandomTipByType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | 
 **userId** | **int**|  | 

### Return type

[**TipDTO**](TipDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

