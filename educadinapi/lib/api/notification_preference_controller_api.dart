//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class NotificationPreferenceControllerApi {
  NotificationPreferenceControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Método utilizado para realizar a inclusão de um entidade
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [NotificationPreferenceDTOCreateUpdate] notificationPreferenceDTOCreateUpdate (required):
  Future<Response> notificationPreferenceControllerCreateWithHttpInfo(NotificationPreferenceDTOCreateUpdate notificationPreferenceDTOCreateUpdate,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences';

    // ignore: prefer_final_locals
    Object? postBody = notificationPreferenceDTOCreateUpdate;

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

  /// Método utilizado para realizar a inclusão de um entidade
  ///
  /// Parameters:
  ///
  /// * [NotificationPreferenceDTOCreateUpdate] notificationPreferenceDTOCreateUpdate (required):
  Future<NotificationPreferenceDTO?> notificationPreferenceControllerCreate(NotificationPreferenceDTOCreateUpdate notificationPreferenceDTOCreateUpdate,) async {
    final response = await notificationPreferenceControllerCreateWithHttpInfo(notificationPreferenceDTOCreateUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationPreferenceDTO',) as NotificationPreferenceDTO;
    
    }
    return null;
  }

  /// Obter os dados completos de uma entidiade pelo id informado!
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id da entidade
  Future<Response> notificationPreferenceControllerGetByIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Obter os dados completos de uma entidiade pelo id informado!
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id da entidade
  Future<NotificationPreferenceDTO?> notificationPreferenceControllerGetById(int id,) async {
    final response = await notificationPreferenceControllerGetByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationPreferenceDTO',) as NotificationPreferenceDTO;
    
    }
    return null;
  }

  /// lista todos modelos
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> notificationPreferenceControllerListAllWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences';

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

  /// lista todos modelos
  Future<List<NotificationPreferenceDTO>?> notificationPreferenceControllerListAll() async {
    final response = await notificationPreferenceControllerListAllWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<NotificationPreferenceDTO>') as List)
        .cast<NotificationPreferenceDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// lista todos modelos paginada
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Pageable] page (required):
  Future<Response> notificationPreferenceControllerListAllPageWithHttpInfo(Pageable page,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences/page';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'page', page));

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

  /// lista todos modelos paginada
  ///
  /// Parameters:
  ///
  /// * [Pageable] page (required):
  Future<PageNotificationPreferenceDTO?> notificationPreferenceControllerListAllPage(Pageable page,) async {
    final response = await notificationPreferenceControllerListAllPageWithHttpInfo(page,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageNotificationPreferenceDTO',) as PageNotificationPreferenceDTO;
    
    }
    return null;
  }

  /// Método utilizado para remover uma entidiade pela id informado
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> notificationPreferenceControllerRemoveWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Método utilizado para remover uma entidiade pela id informado
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<NotificationPreferenceDTO?> notificationPreferenceControllerRemove(int id,) async {
    final response = await notificationPreferenceControllerRemoveWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationPreferenceDTO',) as NotificationPreferenceDTO;
    
    }
    return null;
  }

  /// Realiza a busca pelos valores dos campos informados
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<SearchFieldValue>] searchFieldValue (required):
  Future<Response> notificationPreferenceControllerSearchFieldsActionWithHttpInfo(List<SearchFieldValue> searchFieldValue,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences/search-fields';

    // ignore: prefer_final_locals
    Object? postBody = searchFieldValue;

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

  /// Realiza a busca pelos valores dos campos informados
  ///
  /// Parameters:
  ///
  /// * [List<SearchFieldValue>] searchFieldValue (required):
  Future<List<NotificationPreferenceDTO>?> notificationPreferenceControllerSearchFieldsAction(List<SearchFieldValue> searchFieldValue,) async {
    final response = await notificationPreferenceControllerSearchFieldsActionWithHttpInfo(searchFieldValue,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<NotificationPreferenceDTO>') as List)
        .cast<NotificationPreferenceDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Realiza a busca pelos valores dos campos informados
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<SearchFieldValue>] searchFieldValue (required):
  ///
  /// * [int] page:
  ///
  /// * [int] size:
  ///
  /// * [List<String>] sort:
  Future<Response> notificationPreferenceControllerSearchFieldsActionPageWithHttpInfo(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences/search-fields/page';

    // ignore: prefer_final_locals
    Object? postBody = searchFieldValue;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
    if (size != null) {
      queryParams.addAll(_queryParams('', 'size', size));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('multi', 'sort', sort));
    }

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

  /// Realiza a busca pelos valores dos campos informados
  ///
  /// Parameters:
  ///
  /// * [List<SearchFieldValue>] searchFieldValue (required):
  ///
  /// * [int] page:
  ///
  /// * [int] size:
  ///
  /// * [List<String>] sort:
  Future<PageNotificationPreferenceDTO?> notificationPreferenceControllerSearchFieldsActionPage(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    final response = await notificationPreferenceControllerSearchFieldsActionPageWithHttpInfo(searchFieldValue,  page: page, size: size, sort: sort, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageNotificationPreferenceDTO',) as PageNotificationPreferenceDTO;
    
    }
    return null;
  }

  /// Listagem dos campos de busca
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> notificationPreferenceControllerSearchFieldsListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences/search-fields';

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

  /// Listagem dos campos de busca
  Future<List<SearchField>?> notificationPreferenceControllerSearchFieldsList() async {
    final response = await notificationPreferenceControllerSearchFieldsListWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<SearchField>') as List)
        .cast<SearchField>()
        .toList(growable: false);

    }
    return null;
  }

  /// Método utilizado para altlerar os dados de uma entidiade
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [NotificationPreferenceDTOCreateUpdate] notificationPreferenceDTOCreateUpdate (required):
  Future<Response> notificationPreferenceControllerUpdateWithHttpInfo(int id, NotificationPreferenceDTOCreateUpdate notificationPreferenceDTOCreateUpdate,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/notification-preferences/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = notificationPreferenceDTOCreateUpdate;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Método utilizado para altlerar os dados de uma entidiade
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [NotificationPreferenceDTOCreateUpdate] notificationPreferenceDTOCreateUpdate (required):
  Future<NotificationPreferenceDTO?> notificationPreferenceControllerUpdate(int id, NotificationPreferenceDTOCreateUpdate notificationPreferenceDTOCreateUpdate,) async {
    final response = await notificationPreferenceControllerUpdateWithHttpInfo(id, notificationPreferenceDTOCreateUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationPreferenceDTO',) as NotificationPreferenceDTO;
    
    }
    return null;
  }
}
