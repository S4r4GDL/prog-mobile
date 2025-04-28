//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldResponse {
  /// Returns a new [FieldResponse] instance.
  FieldResponse({
    this.attribute,
    this.description,
  });

  /// Nome do atributo
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? attribute;

  /// Descrição da validação
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldResponse &&
    other.attribute == attribute &&
    other.description == description;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (attribute == null ? 0 : attribute!.hashCode) +
    (description == null ? 0 : description!.hashCode);

  @override
  String toString() => 'FieldResponse[attribute=$attribute, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.attribute != null) {
      json[r'attribute'] = this.attribute;
    } else {
      json[r'attribute'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    return json;
  }

  /// Returns a new [FieldResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FieldResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FieldResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FieldResponse(
        attribute: mapValueOfType<String>(json, r'attribute'),
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<FieldResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldResponse> mapFromJson(dynamic json) {
    final map = <String, FieldResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldResponse-objects as value to a dart map
  static Map<String, List<FieldResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

