//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ExpenseControllerApi {
  ExpenseControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Método utilizado para realizar a inclusão de um entidade
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ExpenseDTOCreateUpdate] expenseDTOCreateUpdate (required):
  Future<Response> expenseControllerCreateWithHttpInfo(ExpenseDTOCreateUpdate expenseDTOCreateUpdate,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses';

    // ignore: prefer_final_locals
    Object? postBody = expenseDTOCreateUpdate;

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
  /// * [ExpenseDTOCreateUpdate] expenseDTOCreateUpdate (required):
  Future<ExpenseDTO?> expenseControllerCreate(ExpenseDTOCreateUpdate expenseDTOCreateUpdate,) async {
    final response = await expenseControllerCreateWithHttpInfo(expenseDTOCreateUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ExpenseDTO',) as ExpenseDTO;
    
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
  Future<Response> expenseControllerGetByIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/{id}'
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
  Future<ExpenseDTO?> expenseControllerGetById(int id,) async {
    final response = await expenseControllerGetByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ExpenseDTO',) as ExpenseDTO;
    
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
  Future<Response> expenseControllerGetByUserIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/user/{id}'
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
  Future<List<ExpenseListDTO>?> expenseControllerGetByUserId(int id,) async {
    final response = await expenseControllerGetByUserIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ExpenseListDTO>') as List)
        .cast<ExpenseListDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// lista todos modelos
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> expenseControllerListAllWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses';

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
  Future<List<ExpenseListDTO>?> expenseControllerListAll() async {
    final response = await expenseControllerListAllWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ExpenseListDTO>') as List)
        .cast<ExpenseListDTO>()
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
  Future<Response> expenseControllerListAllPageWithHttpInfo(Pageable page,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/page';

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
  Future<PageExpenseListDTO?> expenseControllerListAllPage(Pageable page,) async {
    final response = await expenseControllerListAllPageWithHttpInfo(page,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageExpenseListDTO',) as PageExpenseListDTO;
    
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
  Future<Response> expenseControllerListAllPageByUserWithHttpInfo(Pageable page, int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/page/user/{id}'
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
  Future<PageExpenseListDTO?> expenseControllerListAllPageByUser(Pageable page, int id,) async {
    final response = await expenseControllerListAllPageByUserWithHttpInfo(page, id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageExpenseListDTO',) as PageExpenseListDTO;
    
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
  Future<Response> expenseControllerRemoveWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/{id}'
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
  Future<ExpenseDTO?> expenseControllerRemove(int id,) async {
    final response = await expenseControllerRemoveWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ExpenseDTO',) as ExpenseDTO;
    
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
  Future<Response> expenseControllerSearchFieldsActionWithHttpInfo(List<SearchFieldValue> searchFieldValue,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/search-fields';

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
  Future<List<ExpenseListDTO>?> expenseControllerSearchFieldsAction(List<SearchFieldValue> searchFieldValue,) async {
    final response = await expenseControllerSearchFieldsActionWithHttpInfo(searchFieldValue,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ExpenseListDTO>') as List)
        .cast<ExpenseListDTO>()
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
  Future<Response> expenseControllerSearchFieldsActionPageWithHttpInfo(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/search-fields/page';

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
  Future<PageExpenseListDTO?> expenseControllerSearchFieldsActionPage(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    final response = await expenseControllerSearchFieldsActionPageWithHttpInfo(searchFieldValue,  page: page, size: size, sort: sort, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageExpenseListDTO',) as PageExpenseListDTO;
    
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
  Future<Response> expenseControllerSearchFieldsActionPageExpenseWithHttpInfo(int id, List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/search-fields/page/user/{id}'
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
  Future<PageExpenseListDTO?> expenseControllerSearchFieldsActionPageExpense(int id, List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    final response = await expenseControllerSearchFieldsActionPageExpenseWithHttpInfo(id, searchFieldValue,  page: page, size: size, sort: sort, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageExpenseListDTO',) as PageExpenseListDTO;
    
    }
    return null;
  }

  /// Listagem dos campos de busca
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> expenseControllerSearchFieldsListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/search-fields';

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
  Future<List<SearchField>?> expenseControllerSearchFieldsList() async {
    final response = await expenseControllerSearchFieldsListWithHttpInfo();
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
  /// * [ExpenseDTOCreateUpdate] expenseDTOCreateUpdate (required):
  Future<Response> expenseControllerUpdateWithHttpInfo(int id, ExpenseDTOCreateUpdate expenseDTOCreateUpdate,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/expenses/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = expenseDTOCreateUpdate;

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
  /// * [ExpenseDTOCreateUpdate] expenseDTOCreateUpdate (required):
  Future<ExpenseDTO?> expenseControllerUpdate(int id, ExpenseDTOCreateUpdate expenseDTOCreateUpdate,) async {
    final response = await expenseControllerUpdateWithHttpInfo(id, expenseDTOCreateUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ExpenseDTO',) as ExpenseDTO;
    
    }
    return null;
  }
}
