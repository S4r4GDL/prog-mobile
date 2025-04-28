# educadinapi.api.ExpenseControllerApi

## Load the API package
```dart
import 'package:educadinapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**expenseControllerCreate**](ExpenseControllerApi.md#expensecontrollercreate) | **POST** /v1/expenses | 
[**expenseControllerGetById**](ExpenseControllerApi.md#expensecontrollergetbyid) | **GET** /v1/expenses/{id} | 
[**expenseControllerGetByUserId**](ExpenseControllerApi.md#expensecontrollergetbyuserid) | **GET** /v1/expenses/user/{id} | 
[**expenseControllerListAll**](ExpenseControllerApi.md#expensecontrollerlistall) | **GET** /v1/expenses | 
[**expenseControllerListAllPage**](ExpenseControllerApi.md#expensecontrollerlistallpage) | **GET** /v1/expenses/page | 
[**expenseControllerListAllPageByUser**](ExpenseControllerApi.md#expensecontrollerlistallpagebyuser) | **GET** /v1/expenses/page/user/{id} | 
[**expenseControllerRemove**](ExpenseControllerApi.md#expensecontrollerremove) | **DELETE** /v1/expenses/{id} | 
[**expenseControllerSearchFieldsAction**](ExpenseControllerApi.md#expensecontrollersearchfieldsaction) | **POST** /v1/expenses/search-fields | 
[**expenseControllerSearchFieldsActionPage**](ExpenseControllerApi.md#expensecontrollersearchfieldsactionpage) | **POST** /v1/expenses/search-fields/page | 
[**expenseControllerSearchFieldsActionPageExpense**](ExpenseControllerApi.md#expensecontrollersearchfieldsactionpageexpense) | **POST** /v1/expenses/search-fields/page/user/{id} | 
[**expenseControllerSearchFieldsList**](ExpenseControllerApi.md#expensecontrollersearchfieldslist) | **GET** /v1/expenses/search-fields | 
[**expenseControllerUpdate**](ExpenseControllerApi.md#expensecontrollerupdate) | **PUT** /v1/expenses/{id} | 


# **expenseControllerCreate**
> ExpenseDTO expenseControllerCreate(expenseDTOCreateUpdate)



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

final api_instance = ExpenseControllerApi();
final expenseDTOCreateUpdate = ExpenseDTOCreateUpdate(); // ExpenseDTOCreateUpdate | 

try {
    final result = api_instance.expenseControllerCreate(expenseDTOCreateUpdate);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **expenseDTOCreateUpdate** | [**ExpenseDTOCreateUpdate**](ExpenseDTOCreateUpdate.md)|  | 

### Return type

[**ExpenseDTO**](ExpenseDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerGetById**
> ExpenseDTO expenseControllerGetById(id)



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

final api_instance = ExpenseControllerApi();
final id = 789; // int | Id da entidade

try {
    final result = api_instance.expenseControllerGetById(id);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerGetById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id da entidade | 

### Return type

[**ExpenseDTO**](ExpenseDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerGetByUserId**
> List<ExpenseListDTO> expenseControllerGetByUserId(id)



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

final api_instance = ExpenseControllerApi();
final id = 789; // int | Id do usuario

try {
    final result = api_instance.expenseControllerGetByUserId(id);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerGetByUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id do usuario | 

### Return type

[**List<ExpenseListDTO>**](ExpenseListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerListAll**
> List<ExpenseListDTO> expenseControllerListAll()



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

final api_instance = ExpenseControllerApi();

try {
    final result = api_instance.expenseControllerListAll();
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerListAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<ExpenseListDTO>**](ExpenseListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerListAllPage**
> PageExpenseListDTO expenseControllerListAllPage(page)



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

final api_instance = ExpenseControllerApi();
final page = ; // Pageable | 

try {
    final result = api_instance.expenseControllerListAllPage(page);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerListAllPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [**Pageable**](.md)|  | 

### Return type

[**PageExpenseListDTO**](PageExpenseListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerListAllPageByUser**
> PageExpenseListDTO expenseControllerListAllPageByUser(page, id)



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

final api_instance = ExpenseControllerApi();
final page = ; // Pageable | 
final id = 789; // int | Id do usuario

try {
    final result = api_instance.expenseControllerListAllPageByUser(page, id);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerListAllPageByUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [**Pageable**](.md)|  | 
 **id** | **int**| Id do usuario | 

### Return type

[**PageExpenseListDTO**](PageExpenseListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerRemove**
> ExpenseDTO expenseControllerRemove(id)



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

final api_instance = ExpenseControllerApi();
final id = 789; // int | 

try {
    final result = api_instance.expenseControllerRemove(id);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ExpenseDTO**](ExpenseDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerSearchFieldsAction**
> List<ExpenseListDTO> expenseControllerSearchFieldsAction(searchFieldValue)



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

final api_instance = ExpenseControllerApi();
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 

try {
    final result = api_instance.expenseControllerSearchFieldsAction(searchFieldValue);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerSearchFieldsAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchFieldValue** | [**List<SearchFieldValue>**](SearchFieldValue.md)|  | 

### Return type

[**List<ExpenseListDTO>**](ExpenseListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerSearchFieldsActionPage**
> PageExpenseListDTO expenseControllerSearchFieldsActionPage(searchFieldValue, page, size, sort)



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

final api_instance = ExpenseControllerApi();
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 
final page = 56; // int | 
final size = 56; // int | 
final sort = []; // List<String> | 

try {
    final result = api_instance.expenseControllerSearchFieldsActionPage(searchFieldValue, page, size, sort);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerSearchFieldsActionPage: $e\n');
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

[**PageExpenseListDTO**](PageExpenseListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerSearchFieldsActionPageExpense**
> PageExpenseListDTO expenseControllerSearchFieldsActionPageExpense(id, searchFieldValue, page, size, sort)



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

final api_instance = ExpenseControllerApi();
final id = 789; // int | Id do usuario
final searchFieldValue = [List<SearchFieldValue>()]; // List<SearchFieldValue> | 
final page = 56; // int | 
final size = 56; // int | 
final sort = []; // List<String> | 

try {
    final result = api_instance.expenseControllerSearchFieldsActionPageExpense(id, searchFieldValue, page, size, sort);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerSearchFieldsActionPageExpense: $e\n');
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

[**PageExpenseListDTO**](PageExpenseListDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseControllerSearchFieldsList**
> List<SearchField> expenseControllerSearchFieldsList()



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

final api_instance = ExpenseControllerApi();

try {
    final result = api_instance.expenseControllerSearchFieldsList();
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerSearchFieldsList: $e\n');
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

# **expenseControllerUpdate**
> ExpenseDTO expenseControllerUpdate(id, expenseDTOCreateUpdate)



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

final api_instance = ExpenseControllerApi();
final id = 789; // int | 
final expenseDTOCreateUpdate = ExpenseDTOCreateUpdate(); // ExpenseDTOCreateUpdate | 

try {
    final result = api_instance.expenseControllerUpdate(id, expenseDTOCreateUpdate);
    print(result);
} catch (e) {
    print('Exception when calling ExpenseControllerApi->expenseControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **expenseDTOCreateUpdate** | [**ExpenseDTOCreateUpdate**](ExpenseDTOCreateUpdate.md)|  | 

### Return type

[**ExpenseDTO**](ExpenseDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

