# educadinapi.api.GoalControllerApi

## Load the API package
```dart
import 'package:educadinapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**goalControllerCreate**](GoalControllerApi.md#goalcontrollercreate) | **POST** /v1/goals | 
[**goalControllerGetById**](GoalControllerApi.md#goalcontrollergetbyid) | **GET** /v1/goals/{id} | 
[**goalControllerGetByUserId**](GoalControllerApi.md#goalcontrollergetbyuserid) | **GET** /v1/goals/user/{id} | 
[**goalControllerListAll**](GoalControllerApi.md#goalcontrollerlistall) | **GET** /v1/goals | 
[**goalControllerListAllPage**](GoalControllerApi.md#goalcontrollerlistallpage) | **GET** /v1/goals/page | 
[**goalControllerListAllPageByUser**](GoalControllerApi.md#goalcontrollerlistallpagebyuser) | **GET** /v1/goals/page/user/{id} | 
[**goalControllerRemove**](GoalControllerApi.md#goalcontrollerremove) | **DELETE** /v1/goals/{id} | 
[**goalControllerSearchFieldsAction**](GoalControllerApi.md#goalcontrollersearchfieldsaction) | **POST** /v1/goals/search-fields | 
[**goalControllerSearchFieldsActionPage**](GoalControllerApi.md#goalcontrollersearchfieldsactionpage) | **POST** /v1/goals/search-fields/page | 
[**goalControllerSearchFieldsActionPageGoal**](GoalControllerApi.md#goalcontrollersearchfieldsactionpagegoal) | **POST** /v1/goals/search-fields/page/user/{id} | 
[**goalControllerSearchFieldsList**](GoalControllerApi.md#goalcontrollersearchfieldslist) | **GET** /v1/goals/search-fields | 
[**goalControllerUpdate**](GoalControllerApi.md#goalcontrollerupdate) | **PUT** /v1/goals/{id} | 


# **goalControllerCreate**
> GoalDTO goalControllerCreate(goalDTOCreate)



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

final api_instance = GoalControllerApi();
final goalDTOCreate = GoalDTOCreate(); // GoalDTOCreate | 

try {
    final result = api_instance.goalControllerCreate(goalDTOCreate);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **goalDTOCreate** | [**GoalDTOCreate**](GoalDTOCreate.md)|  | 

### Return type

[**GoalDTO**](GoalDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerGetById**
> GoalDTO goalControllerGetById(id)



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

final api_instance = GoalControllerApi();
final id = 789; // int | Id da entidade

try {
    final result = api_instance.goalControllerGetById(id);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerGetById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id da entidade | 

### Return type

[**GoalDTO**](GoalDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerGetByUserId**
> List<GoalListDTO> goalControllerGetByUserId(id)



Obter os dados completos de uma entidiade pelo id do usuario informado!

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = GoalControllerApi();
final id = 789; // int | Id do usuario

try {
    final result = api_instance.goalControllerGetByUserId(id);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerGetByUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id do usuario | 

### Return type

[**List<GoalListDTO>**](GoalListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerListAll**
> List<GoalListDTO> goalControllerListAll()



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

final api_instance = GoalControllerApi();

try {
    final result = api_instance.goalControllerListAll();
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerListAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<GoalListDTO>**](GoalListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerListAllPage**
> PageGoalListDTO goalControllerListAllPage(page)



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

final api_instance = GoalControllerApi();
final page = ; // Pageable | 

try {
    final result = api_instance.goalControllerListAllPage(page);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerListAllPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [**Pageable**](.md)|  | 

### Return type

[**PageGoalListDTO**](PageGoalListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerListAllPageByUser**
> PageGoalListDTO goalControllerListAllPageByUser(page, id)



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

final api_instance = GoalControllerApi();
final page = ; // Pageable | 
final id = 789; // int | Id do usuario

try {
    final result = api_instance.goalControllerListAllPageByUser(page, id);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerListAllPageByUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [**Pageable**](.md)|  | 
 **id** | **int**| Id do usuario | 

### Return type

[**PageGoalListDTO**](PageGoalListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerRemove**
> GoalDTO goalControllerRemove(id)



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

final api_instance = GoalControllerApi();
final id = 789; // int | 

try {
    final result = api_instance.goalControllerRemove(id);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**GoalDTO**](GoalDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerSearchFieldsAction**
> List<GoalListDTO> goalControllerSearchFieldsAction(searchFieldValue)



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

final api_instance = GoalControllerApi();
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 

try {
    final result = api_instance.goalControllerSearchFieldsAction(searchFieldValue);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerSearchFieldsAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchFieldValue** | [**List<SearchFieldValue>**](SearchFieldValue.md)|  | 

### Return type

[**List<GoalListDTO>**](GoalListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerSearchFieldsActionPage**
> PageGoalListDTO goalControllerSearchFieldsActionPage(searchFieldValue, page, size, sort)



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

final api_instance = GoalControllerApi();
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 
final page = 56; // int | 
final size = 56; // int | 
final sort = []; // List<String> | 

try {
    final result = api_instance.goalControllerSearchFieldsActionPage(searchFieldValue, page, size, sort);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerSearchFieldsActionPage: $e\n');
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

[**PageGoalListDTO**](PageGoalListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerSearchFieldsActionPageGoal**
> PageGoalListDTO goalControllerSearchFieldsActionPageGoal(id, searchFieldValue, page, size, sort)



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

final api_instance = GoalControllerApi();
final id = 789; // int | Id do usuario
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 
final page = 56; // int | 
final size = 56; // int | 
final sort = []; // List<String> | 

try {
    final result = api_instance.goalControllerSearchFieldsActionPageGoal(id, searchFieldValue, page, size, sort);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerSearchFieldsActionPageGoal: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id do usuario | 
 **searchFieldValue** | [**List<SearchFieldValue>**](SearchFieldValue.md)|  | 
 **page** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 5]
 **sort** | [**List<String>**](String.md)|  | [optional] [default to const []]

### Return type

[**PageGoalListDTO**](PageGoalListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **goalControllerSearchFieldsList**
> List<SearchField> goalControllerSearchFieldsList()



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

final api_instance = GoalControllerApi();

try {
    final result = api_instance.goalControllerSearchFieldsList();
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerSearchFieldsList: $e\n');
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

# **goalControllerUpdate**
> GoalDTO goalControllerUpdate(id, goalDTOUpdate)



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

final api_instance = GoalControllerApi();
final id = 789; // int | 
final goalDTOUpdate = GoalDTOUpdate(); // GoalDTOUpdate | 

try {
    final result = api_instance.goalControllerUpdate(id, goalDTOUpdate);
    print(result);
} catch (e) {
    print('Exception when calling GoalControllerApi->goalControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **goalDTOUpdate** | [**GoalDTOUpdate**](GoalDTOUpdate.md)|  | 

### Return type

[**GoalDTO**](GoalDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

