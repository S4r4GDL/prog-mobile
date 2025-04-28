//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ExpenseDTO {
  /// Returns a new [ExpenseDTO] instance.
  ExpenseDTO({
    this.id,
    this.categoryName,
    this.name,
    this.description,
    this.amount,
    this.repeatable,
    this.leadTime,
    this.expenseDate,
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

  ExpenseDTORepeatableEnum? repeatable;

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
  DateTime? expenseDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ExpenseDTO &&
    other.id == id &&
    other.categoryName == categoryName &&
    other.name == name &&
    other.description == description &&
    other.amount == amount &&
    other.repeatable == repeatable &&
    other.leadTime == leadTime &&
    other.expenseDate == expenseDate &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (categoryName == null ? 0 : categoryName!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (repeatable == null ? 0 : repeatable!.hashCode) +
    (leadTime == null ? 0 : leadTime!.hashCode) +
    (expenseDate == null ? 0 : expenseDate!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'ExpenseDTO[id=$id, categoryName=$categoryName, name=$name, description=$description, amount=$amount, repeatable=$repeatable, leadTime=$leadTime, expenseDate=$expenseDate, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
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
    if (this.expenseDate != null) {
      json[r'expenseDate'] = _dateFormatter.format(this.expenseDate!.toUtc());
    } else {
      json[r'expenseDate'] = null;
    }
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    return json;
  }

  /// Returns a new [ExpenseDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ExpenseDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ExpenseDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ExpenseDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ExpenseDTO(
        id: mapValueOfType<int>(json, r'id'),
        categoryName: mapValueOfType<String>(json, r'categoryName'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        amount: mapValueOfType<double>(json, r'amount'),
        repeatable: ExpenseDTORepeatableEnum.fromJson(json[r'repeatable']),
        leadTime: mapValueOfType<int>(json, r'leadTime'),
        expenseDate: mapDateTime(json, r'expenseDate', r''),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<ExpenseDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ExpenseDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExpenseDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ExpenseDTO> mapFromJson(dynamic json) {
    final map = <String, ExpenseDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ExpenseDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ExpenseDTO-objects as value to a dart map
  static Map<String, List<ExpenseDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ExpenseDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ExpenseDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class ExpenseDTORepeatableEnum {
  /// Instantiate a new enum with the provided [value].
  const ExpenseDTORepeatableEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const WEEKLY = ExpenseDTORepeatableEnum._(r'WEEKLY');
  static const MONTHLY = ExpenseDTORepeatableEnum._(r'MONTHLY');
  static const YEARLY = ExpenseDTORepeatableEnum._(r'YEARLY');
  static const DONT_REPEATS = ExpenseDTORepeatableEnum._(r'DONT_REPEATS');

  /// List of all possible values in this [enum][ExpenseDTORepeatableEnum].
  static const values = <ExpenseDTORepeatableEnum>[
    WEEKLY,
    MONTHLY,
    YEARLY,
    DONT_REPEATS,
  ];

  static ExpenseDTORepeatableEnum? fromJson(dynamic value) => ExpenseDTORepeatableEnumTypeTransformer().decode(value);

  static List<ExpenseDTORepeatableEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ExpenseDTORepeatableEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ExpenseDTORepeatableEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ExpenseDTORepeatableEnum] to String,
/// and [decode] dynamic data back to [ExpenseDTORepeatableEnum].
class ExpenseDTORepeatableEnumTypeTransformer {
  factory ExpenseDTORepeatableEnumTypeTransformer() => _instance ??= const ExpenseDTORepeatableEnumTypeTransformer._();

  const ExpenseDTORepeatableEnumTypeTransformer._();

  String encode(ExpenseDTORepeatableEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ExpenseDTORepeatableEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ExpenseDTORepeatableEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'WEEKLY': return ExpenseDTORepeatableEnum.WEEKLY;
        case r'MONTHLY': return ExpenseDTORepeatableEnum.MONTHLY;
        case r'YEARLY': return ExpenseDTORepeatableEnum.YEARLY;
        case r'DONT_REPEATS': return ExpenseDTORepeatableEnum.DONT_REPEATS;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ExpenseDTORepeatableEnumTypeTransformer] instance.
  static ExpenseDTORepeatableEnumTypeTransformer? _instance;
}


