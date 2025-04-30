//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MessageResponse {
  /// Returns a new [MessageResponse] instance.
  MessageResponse({
    this.code,
    this.status,
    this.error,
    this.message,
    this.parameters = const [],
    this.attributes = const [],
  });

  /// Código da Mensagem
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code;

  /// Status HTTP
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? status;

  /// Descrição erro HTTP
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  /// Mensagem de negócio
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// Parâmetros da mensagem
  List<Object> parameters;

  /// Atributos de validação
  List<FieldResponse> attributes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MessageResponse &&
    other.code == code &&
    other.status == status &&
    other.error == error &&
    other.message == message &&
    _deepEquality.equals(other.parameters, parameters) &&
    _deepEquality.equals(other.attributes, attributes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (code == null ? 0 : code!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (error == null ? 0 : error!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (parameters.hashCode) +
    (attributes.hashCode);

  @override
  String toString() => 'MessageResponse[code=$code, status=$status, error=$error, message=$message, parameters=$parameters, attributes=$attributes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
      json[r'parameters'] = this.parameters;
      json[r'attributes'] = this.attributes;
    return json;
  }

  /// Returns a new [MessageResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MessageResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MessageResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MessageResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MessageResponse(
        code: mapValueOfType<String>(json, r'code'),
        status: mapValueOfType<int>(json, r'status'),
        error: mapValueOfType<String>(json, r'error'),
        message: mapValueOfType<String>(json, r'message'),
        parameters: listFromJson(json[r'parameters']),
        attributes: FieldResponse.listFromJson(json[r'attributes']),
      );
    }
    return null;
  }

  static List<MessageResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MessageResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MessageResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MessageResponse> mapFromJson(dynamic json) {
    final map = <String, MessageResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MessageResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MessageResponse-objects as value to a dart map
  static Map<String, List<MessageResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MessageResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MessageResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

