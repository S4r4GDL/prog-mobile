//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GoalDTO {
  /// Returns a new [GoalDTO] instance.
  GoalDTO({
    this.id,
    this.name,
    this.amountReached,
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
  int? id;

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
  double? amountReached;

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
  bool operator ==(Object other) => identical(this, other) || other is GoalDTO &&
    other.id == id &&
    other.name == name &&
    other.amountReached == amountReached &&
    other.amountTotal == amountTotal &&
    other.goalDate == goalDate &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (amountReached == null ? 0 : amountReached!.hashCode) +
    (amountTotal == null ? 0 : amountTotal!.hashCode) +
    (goalDate == null ? 0 : goalDate!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'GoalDTO[id=$id, name=$name, amountReached=$amountReached, amountTotal=$amountTotal, goalDate=$goalDate, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.amountReached != null) {
      json[r'amountReached'] = this.amountReached;
    } else {
      json[r'amountReached'] = null;
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

  /// Returns a new [GoalDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GoalDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GoalDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GoalDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GoalDTO(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        amountReached: mapValueOfType<double>(json, r'amountReached'),
        amountTotal: mapValueOfType<double>(json, r'amountTotal'),
        goalDate: mapDateTime(json, r'goalDate', r''),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<GoalDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GoalDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GoalDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GoalDTO> mapFromJson(dynamic json) {
    final map = <String, GoalDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GoalDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GoalDTO-objects as value to a dart map
  static Map<String, List<GoalDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GoalDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GoalDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

