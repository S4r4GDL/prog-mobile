//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CategoryControllerApi {
  CategoryControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Obter os dados completos de uma entidiade pelo id do usuario informado!
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<Response> getByUserIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/categories/user/{id}'
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
  Future<List<CategoryDTO>?> getByUserId(int id,) async {
    final response = await getByUserIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CategoryDTO>') as List)
        .cast<CategoryDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// End point para listar todas as categorias de despesas
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<Response> getExpenseCategoriesWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/categories/expenses/{id}'
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

  /// End point para listar todas as categorias de despesas
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<List<CategoryDTO>?> getExpenseCategories(int id,) async {
    final response = await getExpenseCategoriesWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CategoryDTO>') as List)
        .cast<CategoryDTO>()
        .toList(growable: false);

    }
    return null;
  }

  /// End point para listar todas as categorias de receitas
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<Response> getIncomeCategoriesWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/categories/incomes/{id}'
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

  /// End point para listar todas as categorias de receitas
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Id do usuario
  Future<List<CategoryDTO>?> getIncomeCategories(int id,) async {
    final response = await getIncomeCategoriesWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CategoryDTO>') as List)
        .cast<CategoryDTO>()
        .toList(growable: false);

    }
    return null;
  }
}
