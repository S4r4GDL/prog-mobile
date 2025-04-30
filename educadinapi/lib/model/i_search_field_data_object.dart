//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ISearchFieldDataObject {
  /// Returns a new [ISearchFieldDataObject] instance.
  ISearchFieldDataObject({
    this.id,
    this.searchDescription,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? searchDescription;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ISearchFieldDataObject &&
    other.id == id &&
    other.searchDescription == searchDescription;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (searchDescription == null ? 0 : searchDescription!.hashCode);

  @override
  String toString() => 'ISearchFieldDataObject[id=$id, searchDescription=$searchDescription]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.searchDescription != null) {
      json[r'searchDescription'] = this.searchDescription;
    } else {
      json[r'searchDescription'] = null;
    }
    return json;
  }

  /// Returns a new [ISearchFieldDataObject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ISearchFieldDataObject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ISearchFieldDataObject[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ISearchFieldDataObject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ISearchFieldDataObject(
        id: mapValueOfType<Object>(json, r'id'),
        searchDescription: mapValueOfType<String>(json, r'searchDescription'),
      );
    }
    return null;
  }

  static List<ISearchFieldDataObject> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ISearchFieldDataObject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ISearchFieldDataObject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ISearchFieldDataObject> mapFromJson(dynamic json) {
    final map = <String, ISearchFieldDataObject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ISearchFieldDataObject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ISearchFieldDataObject-objects as value to a dart map
  static Map<String, List<ISearchFieldDataObject>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ISearchFieldDataObject>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ISearchFieldDataObject.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

