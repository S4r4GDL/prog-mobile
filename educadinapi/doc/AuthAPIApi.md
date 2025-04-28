# educadinapi.api.AuthAPIApi

## Load the API package
```dart
import 'package:educadinapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInfoByToken**](AuthAPIApi.md#getinfobytoken) | **GET** /api/v1/auth/info | 
[**getInfoByTokenValidacao**](AuthAPIApi.md#getinfobytokenvalidacao) | **GET** /api/v1/auth/password/request/info | 
[**login**](AuthAPIApi.md#login) | **POST** /api/v1/auth/login | 
[**recoverPassword**](AuthAPIApi.md#recoverpassword) | **GET** /api/v1/auth/reset-password/request/{email} | 
[**refresh**](AuthAPIApi.md#refresh) | **GET** /api/v1/auth/refresh | 
[**resetPassword**](AuthAPIApi.md#resetpassword) | **PUT** /api/v1/auth/reset-password | 


# **getInfoByToken**
> List<CredencialDTO> getInfoByToken(authorization)



Recupera as informações do Usuário conforme o token informado.

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthAPIApi();
final authorization = authorization_example; // String | Token

try {
    final result = api_instance.getInfoByToken(authorization);
    print(result);
} catch (e) {
    print('Exception when calling AuthAPIApi->getInfoByToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Token | 

### Return type

[**List<CredencialDTO>**](CredencialDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getInfoByTokenValidacao**
> List<bool> getInfoByTokenValidacao(requestToken, requestToken2)



Valida o token de alteração de senha.

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthAPIApi();
final requestToken = requestToken_example; // String | Request Token
final requestToken2 = requestToken_example; // String | Request Token

try {
    final result = api_instance.getInfoByTokenValidacao(requestToken, requestToken2);
    print(result);
} catch (e) {
    print('Exception when calling AuthAPIApi->getInfoByTokenValidacao: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestToken** | **String**| Request Token | [optional] 
 **requestToken2** | **String**| Request Token | [optional] 

### Return type

**List<bool>**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> CredencialDTO login(authDTO)



Concede o token de acesso ao Usuário através do 'login' e 'senha'.

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthAPIApi();
final authDTO = AuthDTO(); // AuthDTO | 

try {
    final result = api_instance.login(authDTO);
    print(result);
} catch (e) {
    print('Exception when calling AuthAPIApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authDTO** | [**AuthDTO**](AuthDTO.md)|  | 

### Return type

[**CredencialDTO**](CredencialDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recoverPassword**
> List<CredencialDTO> recoverPassword(email)



Realiza a solicitação de recuperar a senha do usuário.

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthAPIApi();
final email = email_example; // String | Email do Usuário

try {
    final result = api_instance.recoverPassword(email);
    print(result);
} catch (e) {
    print('Exception when calling AuthAPIApi->recoverPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**| Email do Usuário | 

### Return type

[**List<CredencialDTO>**](CredencialDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refresh**
> List<CredencialDTO> refresh(refreshToken)



Concede um novo token de acesso conforme o token de refresh informado.

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthAPIApi();
final refreshToken = refreshToken_example; // String | Token de refresh

try {
    final result = api_instance.refresh(refreshToken);
    print(result);
} catch (e) {
    print('Exception when calling AuthAPIApi->refresh: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshToken** | **String**| Token de refresh | 

### Return type

[**List<CredencialDTO>**](CredencialDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetPassword**
> List<CredencialDTO> resetPassword(authUserDTO, requestToken, requestToken2)



Inclusão ou alteração a senha do usuário.

### Example
```dart
import 'package:educadinapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthAPIApi();
final authUserDTO = AuthUserDTO(); // AuthUserDTO | 
final requestToken = requestToken_example; // String | Request Token
final requestToken2 = requestToken_example; // String | Request Token

try {
    final result = api_instance.resetPassword(authUserDTO, requestToken, requestToken2);
    print(result);
} catch (e) {
    print('Exception when calling AuthAPIApi->resetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authUserDTO** | [**AuthUserDTO**](AuthUserDTO.md)|  | 
 **requestToken** | **String**| Request Token | [optional] 
 **requestToken2** | **String**| Request Token | [optional] 

### Return type

[**List<CredencialDTO>**](CredencialDTO.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

