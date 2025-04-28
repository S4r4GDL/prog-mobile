# educadinapi.api.CategoryControllerApi

## Load the API package
```dart
import 'package:educadinapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getByUserId**](CategoryControllerApi.md#getbyuserid) | **GET** /v1/categories/user/{id} | 
[**getExpenseCategories**](CategoryControllerApi.md#getexpensecategories) | **GET** /v1/categories/expenses/{id} | 
[**getIncomeCategories**](CategoryControllerApi.md#getincomecategories) | **GET** /v1/categories/incomes/{id} | 


# **getByUserId**
> List<CategoryDTO> getByUserId(id)



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

final api_instance = CategoryControllerApi();
final id = 789; // int | Id do usuario

try {
    final result = api_instance.getByUserId(id);
    print(result);
} catch (e) {
    print('Exception when calling CategoryControllerApi->getByUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id do usuario | 

### Return type

[**List<CategoryDTO>**](CategoryDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExpenseCategories**
> List<CategoryDTO> getExpenseCategories(id)



End point para listar todas as categorias de despesas

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CategoryControllerApi();
final id = 789; // int | Id do usuario

try {
    final result = api_instance.getExpenseCategories(id);
    print(result);
} catch (e) {
    print('Exception when calling CategoryControllerApi->getExpenseCategories: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id do usuario | 

### Return type

[**List<CategoryDTO>**](CategoryDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getIncomeCategories**
> List<CategoryDTO> getIncomeCategories(id)



End point para listar todas as categorias de receitas

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CategoryControllerApi();
final id = 789; // int | Id do usuario

try {
    final result = api_instance.getIncomeCategories(id);
    print(result);
} catch (e) {
    print('Exception when calling CategoryControllerApi->getIncomeCategories: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id do usuario | 

### Return type

[**List<CategoryDTO>**](CategoryDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

