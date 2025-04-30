# educadinapi.api.NotificationPreferenceControllerApi

## Load the API package
```dart
import 'package:educadinapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**notificationPreferenceControllerCreate**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollercreate) | **POST** /v1/notification-preferences | 
[**notificationPreferenceControllerGetById**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollergetbyid) | **GET** /v1/notification-preferences/{id} | 
[**notificationPreferenceControllerListAll**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollerlistall) | **GET** /v1/notification-preferences | 
[**notificationPreferenceControllerListAllPage**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollerlistallpage) | **GET** /v1/notification-preferences/page | 
[**notificationPreferenceControllerRemove**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollerremove) | **DELETE** /v1/notification-preferences/{id} | 
[**notificationPreferenceControllerSearchFieldsAction**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollersearchfieldsaction) | **POST** /v1/notification-preferences/search-fields | 
[**notificationPreferenceControllerSearchFieldsActionPage**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollersearchfieldsactionpage) | **POST** /v1/notification-preferences/search-fields/page | 
[**notificationPreferenceControllerSearchFieldsList**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollersearchfieldslist) | **GET** /v1/notification-preferences/search-fields | 
[**notificationPreferenceControllerUpdate**](NotificationPreferenceControllerApi.md#notificationpreferencecontrollerupdate) | **PUT** /v1/notification-preferences/{id} | 


# **notificationPreferenceControllerCreate**
> NotificationPreferenceDTO notificationPreferenceControllerCreate(notificationPreferenceDTOCreateUpdate)



Método utilizado para realizar a inclusão de um entidade

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();
final notificationPreferenceDTOCreateUpdate = NotificationPreferenceDTOCreateUpdate(); // NotificationPreferenceDTOCreateUpdate | 

try {
    final result = api_instance.notificationPreferenceControllerCreate(notificationPreferenceDTOCreateUpdate);
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notificationPreferenceDTOCreateUpdate** | [**NotificationPreferenceDTOCreateUpdate**](NotificationPreferenceDTOCreateUpdate.md)|  | 

### Return type

[**NotificationPreferenceDTO**](NotificationPreferenceDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationPreferenceControllerGetById**
> NotificationPreferenceDTO notificationPreferenceControllerGetById(id)



Obter os dados completos de uma entidiade pelo id informado!

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();
final id = 789; // int | Id da entidade

try {
    final result = api_instance.notificationPreferenceControllerGetById(id);
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerGetById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id da entidade | 

### Return type

[**NotificationPreferenceDTO**](NotificationPreferenceDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationPreferenceControllerListAll**
> List<NotificationPreferenceDTO> notificationPreferenceControllerListAll()



lista todos modelos

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();

try {
    final result = api_instance.notificationPreferenceControllerListAll();
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerListAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<NotificationPreferenceDTO>**](NotificationPreferenceDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationPreferenceControllerListAllPage**
> PageNotificationPreferenceDTO notificationPreferenceControllerListAllPage(page)



lista todos modelos paginada

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();
final page = ; // Pageable | 

try {
    final result = api_instance.notificationPreferenceControllerListAllPage(page);
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerListAllPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [**Pageable**](.md)|  | 

### Return type

[**PageNotificationPreferenceDTO**](PageNotificationPreferenceDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationPreferenceControllerRemove**
> NotificationPreferenceDTO notificationPreferenceControllerRemove(id)



Método utilizado para remover uma entidiade pela id informado

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();
final id = 789; // int | 

try {
    final result = api_instance.notificationPreferenceControllerRemove(id);
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**NotificationPreferenceDTO**](NotificationPreferenceDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationPreferenceControllerSearchFieldsAction**
> List<NotificationPreferenceDTO> notificationPreferenceControllerSearchFieldsAction(searchFieldValue)



Realiza a busca pelos valores dos campos informados

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 

try {
    final result = api_instance.notificationPreferenceControllerSearchFieldsAction(searchFieldValue);
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerSearchFieldsAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchFieldValue** | [**List<SearchFieldValue>**](SearchFieldValue.md)|  | 

### Return type

[**List<NotificationPreferenceDTO>**](NotificationPreferenceDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationPreferenceControllerSearchFieldsActionPage**
> PageNotificationPreferenceDTO notificationPreferenceControllerSearchFieldsActionPage(searchFieldValue, page, size, sort)



Realiza a busca pelos valores dos campos informados

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 
final page = 56; // int | 
final size = 56; // int | 
final sort = []; // List<String> | 

try {
    final result = api_instance.notificationPreferenceControllerSearchFieldsActionPage(searchFieldValue, page, size, sort);
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerSearchFieldsActionPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchFieldValue** | [**List<SearchFieldValue>**](SearchFieldValue.md)|  | 
 **page** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 5]
 **sort** | [**List<String>**](String.md)|  | [optional] [default to const []]

### Return type

[**PageNotificationPreferenceDTO**](PageNotificationPreferenceDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationPreferenceControllerSearchFieldsList**
> List<SearchField> notificationPreferenceControllerSearchFieldsList()



Listagem dos campos de busca

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();

try {
    final result = api_instance.notificationPreferenceControllerSearchFieldsList();
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerSearchFieldsList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<SearchField>**](SearchField.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationPreferenceControllerUpdate**
> NotificationPreferenceDTO notificationPreferenceControllerUpdate(id, notificationPreferenceDTOCreateUpdate)



Método utilizado para altlerar os dados de uma entidiade

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationPreferenceControllerApi();
final id = 789; // int | 
final notificationPreferenceDTOCreateUpdate = NotificationPreferenceDTOCreateUpdate(); // NotificationPreferenceDTOCreateUpdate | 

try {
    final result = api_instance.notificationPreferenceControllerUpdate(id, notificationPreferenceDTOCreateUpdate);
    print(result);
} catch (e) {
    print('Exception when calling NotificationPreferenceControllerApi->notificationPreferenceControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **notificationPreferenceDTOCreateUpdate** | [**NotificationPreferenceDTOCreateUpdate**](NotificationPreferenceDTOCreateUpdate.md)|  | 

### Return type

[**NotificationPreferenceDTO**](NotificationPreferenceDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

