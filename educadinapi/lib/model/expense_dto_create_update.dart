//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ExpenseDTOCreateUpdate {
  /// Returns a new [ExpenseDTOCreateUpdate] instance.
  ExpenseDTOCreateUpdate({
    this.categoryName,
    this.name,
    this.description,
    this.amount,
    this.expenseDate,
    this.repeatable,
    this.leadTime,
    this.userId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? categoryName;

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
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? amount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? expenseDate;

  ExpenseDTOCreateUpdateRepeatableEnum? repeatable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? leadTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ExpenseDTOCreateUpdate &&
    other.categoryName == categoryName &&
    other.name == name &&
    other.description == description &&
    other.amount == amount &&
    other.expenseDate == expenseDate &&
    other.repeatable == repeatable &&
    other.leadTime == leadTime &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (categoryName == null ? 0 : categoryName!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (expenseDate == null ? 0 : expenseDate!.hashCode) +
    (repeatable == null ? 0 : repeatable!.hashCode) +
    (leadTime == null ? 0 : leadTime!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'ExpenseDTOCreateUpdate[categoryName=$categoryName, name=$name, description=$description, amount=$amount, expenseDate=$expenseDate, repeatable=$repeatable, leadTime=$leadTime, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.categoryName != null) {
      json[r'categoryName'] = this.categoryName;
    } else {
      json[r'categoryName'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
    if (this.expenseDate != null) {
      json[r'expenseDate'] = _dateFormatter.format(this.expenseDate!.toUtc());
    } else {
      json[r'expenseDate'] = null;
    }
    if (this.repeatable != null) {
      json[r'repeatable'] = this.repeatable;
    } else {
      json[r'repeatable'] = null;
    }
    if (this.leadTime != null) {
      json[r'leadTime'] = this.leadTime;
    } else {
      json[r'leadTime'] = null;
    }
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    return json;
  }

  /// Returns a new [ExpenseDTOCreateUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ExpenseDTOCreateUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ExpenseDTOCreateUpdate[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ExpenseDTOCreateUpdate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ExpenseDTOCreateUpdate(
        categoryName: mapValueOfType<String>(json, r'categoryName'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        amount: mapValueOfType<double>(json, r'amount'),
        expenseDate: mapDateTime(json, r'expenseDate', r''),
        repeatable: ExpenseDTOCreateUpdateRepeatableEnum.fromJson(json[r'repeatable']),
        leadTime: mapValueOfType<int>(json, r'leadTime'),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<ExpenseDTOCreateUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ExpenseDTOCreateUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExpenseDTOCreateUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ExpenseDTOCreateUpdate> mapFromJson(dynamic json) {
    final map = <String, ExpenseDTOCreateUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ExpenseDTOCreateUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ExpenseDTOCreateUpdate-objects as value to a dart map
  static Map<String, List<ExpenseDTOCreateUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ExpenseDTOCreateUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ExpenseDTOCreateUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class ExpenseDTOCreateUpdateRepeatableEnum {
  /// Instantiate a new enum with the provided [value].
  const ExpenseDTOCreateUpdateRepeatableEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const WEEKLY = ExpenseDTOCreateUpdateRepeatableEnum._(r'WEEKLY');
  static const MONTHLY = ExpenseDTOCreateUpdateRepeatableEnum._(r'MONTHLY');
  static const YEARLY = ExpenseDTOCreateUpdateRepeatableEnum._(r'YEARLY');
  static const DONT_REPEATS = ExpenseDTOCreateUpdateRepeatableEnum._(r'DONT_REPEATS');

  /// List of all possible values in this [enum][ExpenseDTOCreateUpdateRepeatableEnum].
  static const values = <ExpenseDTOCreateUpdateRepeatableEnum>[
    WEEKLY,
    MONTHLY,
    YEARLY,
    DONT_REPEATS,
  ];

  static ExpenseDTOCreateUpdateRepeatableEnum? fromJson(dynamic value) => ExpenseDTOCreateUpdateRepeatableEnumTypeTransformer().decode(value);

  static List<ExpenseDTOCreateUpdateRepeatableEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ExpenseDTOCreateUpdateRepeatableEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExpenseDTOCreateUpdateRepeatableEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ExpenseDTOCreateUpdateRepeatableEnum] to String,
/// and [decode] dynamic data back to [ExpenseDTOCreateUpdateRepeatableEnum].
class ExpenseDTOCreateUpdateRepeatableEnumTypeTransformer {
  factory ExpenseDTOCreateUpdateRepeatableEnumTypeTransformer() => _instance ??= const ExpenseDTOCreateUpdateRepeatableEnumTypeTransformer._();

  const ExpenseDTOCreateUpdateRepeatableEnumTypeTransformer._();

  String encode(ExpenseDTOCreateUpdateRepeatableEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ExpenseDTOCreateUpdateRepeatableEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ExpenseDTOCreateUpdateRepeatableEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'WEEKLY': return ExpenseDTOCreateUpdateRepeatableEnum.WEEKLY;
        case r'MONTHLY': return ExpenseDTOCreateUpdateRepeatableEnum.MONTHLY;
        case r'YEARLY': return ExpenseDTOCreateUpdateRepeatableEnum.YEARLY;
        case r'DONT_REPEATS': return ExpenseDTOCreateUpdateRepeatableEnum.DONT_REPEATS;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ExpenseDTOCreateUpdateRepeatableEnumTypeTransformer] instance.
  static ExpenseDTOCreateUpdateRepeatableEnumTypeTransformer? _instance;
}


