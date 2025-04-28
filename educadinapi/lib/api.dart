//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_api_api.dart';
part 'api/category_controller_api.dart';
part 'api/expense_controller_api.dart';
part 'api/goal_controller_api.dart';
part 'api/income_controller_api.dart';
part 'api/notification_controller_api.dart';
part 'api/notification_preference_controller_api.dart';
part 'api/tip_controller_api.dart';
part 'api/user_controller_api.dart';

part 'model/auth_dto.dart';
part 'model/auth_user_dto.dart';
part 'model/category.dart';
part 'model/category_dto.dart';
part 'model/credencial_dto.dart';
part 'model/expense_dto.dart';
part 'model/expense_dto_create_update.dart';
part 'model/expense_list_dto.dart';
part 'model/field_response.dart';
part 'model/goal_dto.dart';
part 'model/goal_dto_create.dart';
part 'model/goal_dto_update.dart';
part 'model/goal_list_dto.dart';
part 'model/i_search_field_data_object.dart';
part 'model/income_dto.dart';
part 'model/income_dto_create_update.dart';
part 'model/income_list_dto.dart';
part 'model/login.dart';
part 'model/message_response.dart';
part 'model/notification_dto.dart';
part 'model/notification_preference_dto.dart';
part 'model/notification_preference_dto_create_update.dart';
part 'model/page_expense_list_dto.dart';
part 'model/page_goal_list_dto.dart';
part 'model/page_income_list_dto.dart';
part 'model/page_notification_preference_dto.dart';
part 'model/pageable.dart';
part 'model/pageable_object.dart';
part 'model/search_field.dart';
part 'model/search_field_value.dart';
part 'model/sort_object.dart';
part 'model/tip_dto.dart';
part 'model/user.dart';
part 'model/user_create_dto.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
