# educadinapi.api.IncomeControllerApi

## Load the API package
```dart
import 'package:educadinapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**incomeControllerCreate**](IncomeControllerApi.md#incomecontrollercreate) | **POST** /v1/incomes | 
[**incomeControllerGetById**](IncomeControllerApi.md#incomecontrollergetbyid) | **GET** /v1/incomes/{id} | 
[**incomeControllerGetByUserId**](IncomeControllerApi.md#incomecontrollergetbyuserid) | **GET** /v1/incomes/user/{id} | 
[**incomeControllerListAll**](IncomeControllerApi.md#incomecontrollerlistall) | **GET** /v1/incomes | 
[**incomeControllerListAllPage**](IncomeControllerApi.md#incomecontrollerlistallpage) | **GET** /v1/incomes/page | 
[**incomeControllerListAllPageByUser**](IncomeControllerApi.md#incomecontrollerlistallpagebyuser) | **GET** /v1/incomes/page/user/{id} | 
[**incomeControllerRemove**](IncomeControllerApi.md#incomecontrollerremove) | **DELETE** /v1/incomes/{id} | 
[**incomeControllerSearchFieldsAction**](IncomeControllerApi.md#incomecontrollersearchfieldsaction) | **POST** /v1/incomes/search-fields | 
[**incomeControllerSearchFieldsActionPage**](IncomeControllerApi.md#incomecontrollersearchfieldsactionpage) | **POST** /v1/incomes/search-fields/page | 
[**incomeControllerSearchFieldsActionPageIncome**](IncomeControllerApi.md#incomecontrollersearchfieldsactionpageincome) | **POST** /v1/incomes/search-fields/page/user/{id} | 
[**incomeControllerSearchFieldsList**](IncomeControllerApi.md#incomecontrollersearchfieldslist) | **GET** /v1/incomes/search-fields | 
[**incomeControllerUpdate**](IncomeControllerApi.md#incomecontrollerupdate) | **PUT** /v1/incomes/{id} | 


# **incomeControllerCreate**
> IncomeDTO incomeControllerCreate(incomeDTOCreateUpdate)



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

final api_instance = IncomeControllerApi();
final incomeDTOCreateUpdate = IncomeDTOCreateUpdate(); // IncomeDTOCreateUpdate | 

try {
    final result = api_instance.incomeControllerCreate(incomeDTOCreateUpdate);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **incomeDTOCreateUpdate** | [**IncomeDTOCreateUpdate**](IncomeDTOCreateUpdate.md)|  | 

### Return type

[**IncomeDTO**](IncomeDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerGetById**
> IncomeDTO incomeControllerGetById(id)



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

final api_instance = IncomeControllerApi();
final id = 789; // int | Id da entidade

try {
    final result = api_instance.incomeControllerGetById(id);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerGetById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id da entidade | 

### Return type

[**IncomeDTO**](IncomeDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerGetByUserId**
> List<IncomeListDTO> incomeControllerGetByUserId(id)



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

final api_instance = IncomeControllerApi();
final id = 789; // int | Id do usuario

try {
    final result = api_instance.incomeControllerGetByUserId(id);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerGetByUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id do usuario | 

### Return type

[**List<IncomeListDTO>**](IncomeListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerListAll**
> List<IncomeListDTO> incomeControllerListAll()



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

final api_instance = IncomeControllerApi();

try {
    final result = api_instance.incomeControllerListAll();
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerListAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<IncomeListDTO>**](IncomeListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerListAllPage**
> PageIncomeListDTO incomeControllerListAllPage(page)



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

final api_instance = IncomeControllerApi();
final page = ; // Pageable | 

try {
    final result = api_instance.incomeControllerListAllPage(page);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerListAllPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [**Pageable**](.md)|  | 

### Return type

[**PageIncomeListDTO**](PageIncomeListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerListAllPageByUser**
> PageIncomeListDTO incomeControllerListAllPageByUser(page, id)



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

final api_instance = IncomeControllerApi();
final page = ; // Pageable | 
final id = 789; // int | Id do usuario

try {
    final result = api_instance.incomeControllerListAllPageByUser(page, id);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerListAllPageByUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [**Pageable**](.md)|  | 
 **id** | **int**| Id do usuario | 

### Return type

[**PageIncomeListDTO**](PageIncomeListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerRemove**
> IncomeDTO incomeControllerRemove(id)



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

final api_instance = IncomeControllerApi();
final id = 789; // int | 

try {
    final result = api_instance.incomeControllerRemove(id);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**IncomeDTO**](IncomeDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerSearchFieldsAction**
> List<IncomeListDTO> incomeControllerSearchFieldsAction(searchFieldValue)



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

final api_instance = IncomeControllerApi();
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 

try {
    final result = api_instance.incomeControllerSearchFieldsAction(searchFieldValue);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerSearchFieldsAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchFieldValue** | [**List<SearchFieldValue>**](SearchFieldValue.md)|  | 

### Return type

[**List<IncomeListDTO>**](IncomeListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerSearchFieldsActionPage**
> PageIncomeListDTO incomeControllerSearchFieldsActionPage(searchFieldValue, page, size, sort)



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

final api_instance = IncomeControllerApi();
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 
final page = 56; // int | 
final size = 56; // int | 
final sort = []; // List<String> | 

try {
    final result = api_instance.incomeControllerSearchFieldsActionPage(searchFieldValue, page, size, sort);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerSearchFieldsActionPage: $e\n');
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

[**PageIncomeListDTO**](PageIncomeListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerSearchFieldsActionPageIncome**
> PageIncomeListDTO incomeControllerSearchFieldsActionPageIncome(id, searchFieldValue, page, size, sort)



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

final api_instance = IncomeControllerApi();
final id = 789; // int | Id do usuario
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 
final page = 56; // int | 
final size = 56; // int | 
final sort = []; // List<String> | 

try {
    final result = api_instance.incomeControllerSearchFieldsActionPageIncome(id, searchFieldValue, page, size, sort);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerSearchFieldsActionPageIncome: $e\n');
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

[**PageIncomeListDTO**](PageIncomeListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **incomeControllerSearchFieldsList**
> List<SearchField> incomeControllerSearchFieldsList()



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

final api_instance = IncomeControllerApi();

try {
    final result = api_instance.incomeControllerSearchFieldsList();
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerSearchFieldsList: $e\n');
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

# **incomeControllerUpdate**
> IncomeDTO incomeControllerUpdate(id, incomeDTOCreateUpdate)



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

final api_instance = IncomeControllerApi();
final id = 789; // int | 
final incomeDTOCreateUpdate = IncomeDTOCreateUpdate(); // IncomeDTOCreateUpdate | 

try {
    final result = api_instance.incomeControllerUpdate(id, incomeDTOCreateUpdate);
    print(result);
} catch (e) {
    print('Exception when calling IncomeControllerApi->incomeControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **incomeDTOCreateUpdate** | [**IncomeDTOCreateUpdate**](IncomeDTOCreateUpdate.md)|  | 

### Return type

[**IncomeDTO**](IncomeDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

