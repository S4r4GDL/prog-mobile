//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthAPIApi {
  AuthAPIApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Recupera as informações do Usuário conforme o token informado.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   Token
  Future<Response> getInfoByTokenWithHttpInfo(String authorization,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/info';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Recupera as informações do Usuário conforme o token informado.
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   Token
  Future<List<CredencialDTO>?> getInfoByToken(String authorization,) async {
    final response = await getInfoByTokenWithHttpInfo(authorization,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CredencialDTO>') as List)
        .cast<CredencialDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Valida o token de alteração de senha.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] requestToken:
  ///   Request Token
  ///
  /// * [String] requestToken2:
  ///   Request Token
  Future<Response> getInfoByTokenValidacaoWithHttpInfo({ String? requestToken, String? requestToken2, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/password/request/info';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (requestToken != null) {
      queryParams.addAll(_queryParams('', 'requestToken', requestToken));
    }

    if (requestToken2 != null) {
      headerParams[r'Request-Token'] = parameterToString(requestToken2);
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Valida o token de alteração de senha.
  ///
  /// Parameters:
  ///
  /// * [String] requestToken:
  ///   Request Token
  ///
  /// * [String] requestToken2:
  ///   Request Token
  Future<List<bool>?> getInfoByTokenValidacao({ String? requestToken, String? requestToken2, }) async {
    final response = await getInfoByTokenValidacaoWithHttpInfo( requestToken: requestToken, requestToken2: requestToken2, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<bool>') as List)
        .cast<bool>()
        .toList(growable: false);

    }
    return null;
  }

  /// Concede o token de acesso ao Usuário através do 'login' e 'senha'.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthDTO] authDTO (required):
  Future<Response> loginWithHttpInfo(AuthDTO authDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/login';

    // ignore: prefer_final_locals
    Object? postBody = authDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Concede o token de acesso ao Usuário através do 'login' e 'senha'.
  ///
  /// Parameters:
  ///
  /// * [AuthDTO] authDTO (required):
  Future<CredencialDTO?> login(AuthDTO authDTO,) async {
    final response = await loginWithHttpInfo(authDTO,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CredencialDTO',) as CredencialDTO;
    
    }
    return null;
  }

  /// Realiza a solicitação de recuperar a senha do usuário.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] email (required):
  ///   Email do Usuário
  Future<Response> recoverPasswordWithHttpInfo(String email,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/reset-password/request/{email}'
      .replaceAll('{email}', email);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Realiza a solicitação de recuperar a senha do usuário.
  ///
  /// Parameters:
  ///
  /// * [String] email (required):
  ///   Email do Usuário
  Future<List<CredencialDTO>?> recoverPassword(String email,) async {
    final response = await recoverPasswordWithHttpInfo(email,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CredencialDTO>') as List)
        .cast<CredencialDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Concede um novo token de acesso conforme o token de refresh informado.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] refreshToken (required):
  ///   Token de refresh
  Future<Response> refreshWithHttpInfo(String refreshToken,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/refresh';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'refreshToken', refreshToken));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Concede um novo token de acesso conforme o token de refresh informado.
  ///
  /// Parameters:
  ///
  /// * [String] refreshToken (required):
  ///   Token de refresh
  Future<List<CredencialDTO>?> refresh(String refreshToken,) async {
    final response = await refreshWithHttpInfo(refreshToken,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CredencialDTO>') as List)
        .cast<CredencialDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Inclusão ou alteração a senha do usuário.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthUserDTO] authUserDTO (required):
  ///
  /// * [String] requestToken:
  ///   Request Token
  ///
  /// * [String] requestToken2:
  ///   Request Token
  Future<Response> resetPasswordWithHttpInfo(AuthUserDTO authUserDTO, { String? requestToken, String? requestToken2, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/reset-password';

    // ignore: prefer_final_locals
    Object? postBody = authUserDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (requestToken != null) {
      queryParams.addAll(_queryParams('', 'requestToken', requestToken));
    }

    if (requestToken2 != null) {
      headerParams[r'Request-Token'] = parameterToString(requestToken2);
    }

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Inclusão ou alteração a senha do usuário.
  ///
  /// Parameters:
  ///
  /// * [AuthUserDTO] authUserDTO (required):
  ///
  /// * [String] requestToken:
  ///   Request Token
  ///
  /// * [String] requestToken2:
  ///   Request Token
  Future<List<CredencialDTO>?> resetPassword(AuthUserDTO authUserDTO, { String? requestToken, String? requestToken2, }) async {
    final response = await resetPasswordWithHttpInfo(authUserDTO,  requestToken: requestToken, requestToken2: requestToken2, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CredencialDTO>') as List)
        .cast<CredencialDTO>()
        .toList(growable: false);

    }
    return null;
  }
}
