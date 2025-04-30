//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GoalDTOCreate {
  /// Returns a new [GoalDTOCreate] instance.
  GoalDTOCreate({
    this.name,
    this.amountTotal,
    this.goalDate,
    this.userId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? amountTotal;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? goalDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GoalDTOCreate &&
    other.name == name &&
    other.amountTotal == amountTotal &&
    other.goalDate == goalDate &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (amountTotal == null ? 0 : amountTotal!.hashCode) +
    (goalDate == null ? 0 : goalDate!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'GoalDTOCreate[name=$name, amountTotal=$amountTotal, goalDate=$goalDate, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.amountTotal != null) {
      json[r'amountTotal'] = this.amountTotal;
    } else {
      json[r'amountTotal'] = null;
    }
    if (this.goalDate != null) {
      json[r'goalDate'] = _dateFormatter.format(this.goalDate!.toUtc());
    } else {
      json[r'goalDate'] = null;
    }
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    return json;
  }

  /// Returns a new [GoalDTOCreate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GoalDTOCreate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GoalDTOCreate[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GoalDTOCreate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GoalDTOCreate(
        name: mapValueOfType<String>(json, r'name'),
        amountTotal: mapValueOfType<double>(json, r'amountTotal'),
        goalDate: mapDateTime(json, r'goalDate', r''),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<GoalDTOCreate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GoalDTOCreate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GoalDTOCreate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GoalDTOCreate> mapFromJson(dynamic json) {
    final map = <String, GoalDTOCreate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GoalDTOCreate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GoalDTOCreate-objects as value to a dart map
  static Map<String, List<GoalDTOCreate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GoalDTOCreate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GoalDTOCreate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

