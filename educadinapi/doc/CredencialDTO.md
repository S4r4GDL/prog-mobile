# educadinapi.model.CredencialDTO

## Load the model package
```dart
import 'package:educadinapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Id do Usuário | [optional] 
**name** | **String** | Nome do Usuário | [optional] 
**login** | **String** | Login do Usuário | [optional] 
**email** | **String** | Email do Usário | [optional] 
**roles** | **List<String>** | Lista de permissões do Usuário | [optional] [default to const []]
**accessToken** | **String** | Token de acesso | [optional] 
**expiresIn** | **int** | Tempo de expiração do token de acesso | [optional] 
**refreshToken** | **String** | Token de refresh | [optional] 
**refreshExpiresIn** | **int** | Tempo de expiração do token de refresh | [optional] 
**activeState** | **bool** | Indica se o usuário está ativo | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


