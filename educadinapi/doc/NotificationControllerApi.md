# educadinapi.api.NotificationControllerApi

## Load the API package
```dart
import 'package:educadinapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createNotification**](NotificationControllerApi.md#createnotification) | **POST** /v1/notifications | 


# **createNotification**
> NotificationDTO createNotification(notificationDTO)



### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationControllerApi();
final notificationDTO = NotificationDTO(); // NotificationDTO | 

try {
    final result = api_instance.createNotification(notificationDTO);
    print(result);
} catch (e) {
    print('Exception when calling NotificationControllerApi->createNotification: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notificationDTO** | [**NotificationDTO**](NotificationDTO.md)|  | 

### Return type

[**NotificationDTO**](NotificationDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

