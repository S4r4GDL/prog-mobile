//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IncomeControllerApi {
  IncomeControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Método utilizado para realizar a inclusão de um entidade
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IncomeDTOCreateUpdate] incomeDTOCreateUpdate (required):
  Future<Response> incomeControllerCreateWithHttpInfo(IncomeDTOCreateUpdate incomeDTOCreateUpdate,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes';

    // ignore: prefer_final_locals
    Object? postBody = incomeDTOCreateUpdate;

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
  /// * [IncomeDTOCreateUpdate] incomeDTOCreateUpdate (required):
  Future<IncomeDTO?> incomeControllerCreate(IncomeDTOCreateUpdate incomeDTOCreateUpdate,) async {
    final response = await incomeControllerCreateWithHttpInfo(incomeDTOCreateUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IncomeDTO',) as IncomeDTO;
    
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
  Future<Response> incomeControllerGetByIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/{id}'
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
  Future<IncomeDTO?> incomeControllerGetById(int id,) async {
    final response = await incomeControllerGetByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IncomeDTO',) as IncomeDTO;
    
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
  Future<Response> incomeControllerGetByUserIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/user/{id}'
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
  Future<List<IncomeListDTO>?> incomeControllerGetByUserId(int id,) async {
    final response = await incomeControllerGetByUserIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<IncomeListDTO>') as List)
        .cast<IncomeListDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// lista todos modelos
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> incomeControllerListAllWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes';

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
  Future<List<IncomeListDTO>?> incomeControllerListAll() async {
    final response = await incomeControllerListAllWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<IncomeListDTO>') as List)
        .cast<IncomeListDTO>()
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
  Future<Response> incomeControllerListAllPageWithHttpInfo(Pageable page,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/page';

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
  Future<PageIncomeListDTO?> incomeControllerListAllPage(Pageable page,) async {
    final response = await incomeControllerListAllPageWithHttpInfo(page,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageIncomeListDTO',) as PageIncomeListDTO;
    
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
  Future<Response> incomeControllerListAllPageByUserWithHttpInfo(Pageable page, int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/page/user/{id}'
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
  Future<PageIncomeListDTO?> incomeControllerListAllPageByUser(Pageable page, int id,) async {
    final response = await incomeControllerListAllPageByUserWithHttpInfo(page, id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageIncomeListDTO',) as PageIncomeListDTO;
    
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
  Future<Response> incomeControllerRemoveWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/{id}'
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
  Future<IncomeDTO?> incomeControllerRemove(int id,) async {
    final response = await incomeControllerRemoveWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IncomeDTO',) as IncomeDTO;
    
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
  Future<Response> incomeControllerSearchFieldsActionWithHttpInfo(List<SearchFieldValue> searchFieldValue,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/search-fields';

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
  Future<List<IncomeListDTO>?> incomeControllerSearchFieldsAction(List<SearchFieldValue> searchFieldValue,) async {
    final response = await incomeControllerSearchFieldsActionWithHttpInfo(searchFieldValue,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<IncomeListDTO>') as List)
        .cast<IncomeListDTO>()
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
  Future<Response> incomeControllerSearchFieldsActionPageWithHttpInfo(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/search-fields/page';

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
  Future<PageIncomeListDTO?> incomeControllerSearchFieldsActionPage(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    final response = await incomeControllerSearchFieldsActionPageWithHttpInfo(searchFieldValue,  page: page, size: size, sort: sort, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageIncomeListDTO',) as PageIncomeListDTO;
    
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
  Future<Response> incomeControllerSearchFieldsActionPageIncomeWithHttpInfo(int id, List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/search-fields/page/user/{id}'
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
  Future<PageIncomeListDTO?> incomeControllerSearchFieldsActionPageIncome(int id, List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    final response = await incomeControllerSearchFieldsActionPageIncomeWithHttpInfo(id, searchFieldValue,  page: page, size: size, sort: sort, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageIncomeListDTO',) as PageIncomeListDTO;
    
    }
    return null;
  }

  /// Listagem dos campos de busca
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> incomeControllerSearchFieldsListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/search-fields';

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
  Future<List<SearchField>?> incomeControllerSearchFieldsList() async {
    final response = await incomeControllerSearchFieldsListWithHttpInfo();
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
  /// * [IncomeDTOCreateUpdate] incomeDTOCreateUpdate (required):
  Future<Response> incomeControllerUpdateWithHttpInfo(int id, IncomeDTOCreateUpdate incomeDTOCreateUpdate,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/incomes/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = incomeDTOCreateUpdate;

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
  /// * [IncomeDTOCreateUpdate] incomeDTOCreateUpdate (required):
  Future<IncomeDTO?> incomeControllerUpdate(int id, IncomeDTOCreateUpdate incomeDTOCreateUpdate,) async {
    final response = await incomeControllerUpdateWithHttpInfo(id, incomeDTOCreateUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IncomeDTO',) as IncomeDTO;
    
    }
    return null;
  }
}
