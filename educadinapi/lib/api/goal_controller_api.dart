//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class GoalControllerApi {
  GoalControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Método utilizado para realizar a inclusão de um entidade
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [GoalDTOCreate] goalDTOCreate (required):
  Future<Response> goalControllerCreateWithHttpInfo(GoalDTOCreate goalDTOCreate,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals';

    // ignore: prefer_final_locals
    Object? postBody = goalDTOCreate;

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
  /// * [GoalDTOCreate] goalDTOCreate (required):
  Future<GoalDTO?> goalControllerCreate(GoalDTOCreate goalDTOCreate,) async {
    final response = await goalControllerCreateWithHttpInfo(goalDTOCreate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GoalDTO',) as GoalDTO;
    
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
  Future<Response> goalControllerGetByIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/{id}'
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
  Future<GoalDTO?> goalControllerGetById(int id,) async {
    final response = await goalControllerGetByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GoalDTO',) as GoalDTO;
    
    }
    return null;
  }

  /// Obter os dados completos de uma entidiade pelo id do usuario informado!
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<Response> goalControllerGetByUserIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/user/{id}'
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

  /// Obter os dados completos de uma entidiade pelo id do usuario informado!
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<List<GoalListDTO>?> goalControllerGetByUserId(int id,) async {
    final response = await goalControllerGetByUserIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GoalListDTO>') as List)
        .cast<GoalListDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// lista todos modelos
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> goalControllerListAllWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals';

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
  Future<List<GoalListDTO>?> goalControllerListAll() async {
    final response = await goalControllerListAllWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GoalListDTO>') as List)
        .cast<GoalListDTO>()
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
  Future<Response> goalControllerListAllPageWithHttpInfo(Pageable page,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/page';

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
  Future<PageGoalListDTO?> goalControllerListAllPage(Pageable page,) async {
    final response = await goalControllerListAllPageWithHttpInfo(page,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageGoalListDTO',) as PageGoalListDTO;
    
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
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<Response> goalControllerListAllPageByUserWithHttpInfo(Pageable page, int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/page/user/{id}'
      .replaceAll('{id}', id.toString());

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
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<PageGoalListDTO?> goalControllerListAllPageByUser(Pageable page, int id,) async {
    final response = await goalControllerListAllPageByUserWithHttpInfo(page, id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageGoalListDTO',) as PageGoalListDTO;
    
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
  Future<Response> goalControllerRemoveWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/{id}'
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
  Future<GoalDTO?> goalControllerRemove(int id,) async {
    final response = await goalControllerRemoveWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GoalDTO',) as GoalDTO;
    
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
  Future<Response> goalControllerSearchFieldsActionWithHttpInfo(List<SearchFieldValue> searchFieldValue,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/search-fields';

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
  Future<List<GoalListDTO>?> goalControllerSearchFieldsAction(List<SearchFieldValue> searchFieldValue,) async {
    final response = await goalControllerSearchFieldsActionWithHttpInfo(searchFieldValue,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GoalListDTO>') as List)
        .cast<GoalListDTO>()
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
  Future<Response> goalControllerSearchFieldsActionPageWithHttpInfo(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/search-fields/page';

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
  Future<PageGoalListDTO?> goalControllerSearchFieldsActionPage(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    final response = await goalControllerSearchFieldsActionPageWithHttpInfo(searchFieldValue,  page: page, size: size, sort: sort, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageGoalListDTO',) as PageGoalListDTO;
    
    }
    return null;
  }

  /// Realiza a busca pelos valores dos campos informados
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id do usuario
  ///
  /// * [List<SearchFieldValue>] searchFieldValue (required):
  ///
  /// * [int] page:
  ///
  /// * [int] size:
  ///
  /// * [List<String>] sort:
  Future<Response> goalControllerSearchFieldsActionPageGoalWithHttpInfo(int id, List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/search-fields/page/user/{id}'
      .replaceAll('{id}', id.toString());

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
  /// * [int] id (required):
  ///   Id do usuario
  ///
  /// * [List<SearchFieldValue>] searchFieldValue (required):
  ///
  /// * [int] page:
  ///
  /// * [int] size:
  ///
  /// * [List<String>] sort:
  Future<PageGoalListDTO?> goalControllerSearchFieldsActionPageGoal(int id, List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    final response = await goalControllerSearchFieldsActionPageGoalWithHttpInfo(id, searchFieldValue,  page: page, size: size, sort: sort, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageGoalListDTO',) as PageGoalListDTO;
    
    }
    return null;
  }

  /// Listagem dos campos de busca
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> goalControllerSearchFieldsListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/search-fields';

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
  Future<List<SearchField>?> goalControllerSearchFieldsList() async {
    final response = await goalControllerSearchFieldsListWithHttpInfo();
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
  /// * [GoalDTOUpdate] goalDTOUpdate (required):
  Future<Response> goalControllerUpdateWithHttpInfo(int id, GoalDTOUpdate goalDTOUpdate,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/goals/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = goalDTOUpdate;

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
  /// * [GoalDTOUpdate] goalDTOUpdate (required):
  Future<GoalDTO?> goalControllerUpdate(int id, GoalDTOUpdate goalDTOUpdate,) async {
    final response = await goalControllerUpdateWithHttpInfo(id, goalDTOUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GoalDTO',) as GoalDTO;
    
    }
    return null;
  }
}
