//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GoalListDTO {
  /// Returns a new [GoalListDTO] instance.
  GoalListDTO({
    this.id,
    this.name,
    this.amountReached,
    this.amountTotal,
    this.goalDate,
    this.goalPercent,
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
  double? goalPercent;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GoalListDTO &&
    other.id == id &&
    other.name == name &&
    other.amountReached == amountReached &&
    other.amountTotal == amountTotal &&
    other.goalDate == goalDate &&
    other.goalPercent == goalPercent &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (amountReached == null ? 0 : amountReached!.hashCode) +
    (amountTotal == null ? 0 : amountTotal!.hashCode) +
    (goalDate == null ? 0 : goalDate!.hashCode) +
    (goalPercent == null ? 0 : goalPercent!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'GoalListDTO[id=$id, name=$name, amountReached=$amountReached, amountTotal=$amountTotal, goalDate=$goalDate, goalPercent=$goalPercent, userId=$userId]';

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
    if (this.goalPercent != null) {
      json[r'goalPercent'] = this.goalPercent;
    } else {
      json[r'goalPercent'] = null;
    }
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    return json;
  }

  /// Returns a new [GoalListDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GoalListDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GoalListDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GoalListDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GoalListDTO(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        amountReached: mapValueOfType<double>(json, r'amountReached'),
        amountTotal: mapValueOfType<double>(json, r'amountTotal'),
        goalDate: mapDateTime(json, r'goalDate', r''),
        goalPercent: mapValueOfType<double>(json, r'goalPercent'),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<GoalListDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GoalListDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GoalListDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GoalListDTO> mapFromJson(dynamic json) {
    final map = <String, GoalListDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GoalListDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GoalListDTO-objects as value to a dart map
  static Map<String, List<GoalListDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GoalListDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GoalListDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

