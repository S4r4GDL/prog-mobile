//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IncomeDTOCreateUpdate {
  /// Returns a new [IncomeDTOCreateUpdate] instance.
  IncomeDTOCreateUpdate({
    this.categoryName,
    this.name,
    this.description,
    this.amount,
    this.repeatable,
    this.incomeDate,
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

  IncomeDTOCreateUpdateRepeatableEnum? repeatable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? incomeDate;

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
  bool operator ==(Object other) => identical(this, other) || other is IncomeDTOCreateUpdate &&
    other.categoryName == categoryName &&
    other.name == name &&
    other.description == description &&
    other.amount == amount &&
    other.repeatable == repeatable &&
    other.incomeDate == incomeDate &&
    other.leadTime == leadTime &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (categoryName == null ? 0 : categoryName!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (repeatable == null ? 0 : repeatable!.hashCode) +
    (incomeDate == null ? 0 : incomeDate!.hashCode) +
    (leadTime == null ? 0 : leadTime!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'IncomeDTOCreateUpdate[categoryName=$categoryName, name=$name, description=$description, amount=$amount, repeatable=$repeatable, incomeDate=$incomeDate, leadTime=$leadTime, userId=$userId]';

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
    if (this.repeatable != null) {
      json[r'repeatable'] = this.repeatable;
    } else {
      json[r'repeatable'] = null;
    }
    if (this.incomeDate != null) {
      json[r'incomeDate'] = _dateFormatter.format(this.incomeDate!.toUtc());
    } else {
      json[r'incomeDate'] = null;
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

  /// Returns a new [IncomeDTOCreateUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IncomeDTOCreateUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "IncomeDTOCreateUpdate[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "IncomeDTOCreateUpdate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IncomeDTOCreateUpdate(
        categoryName: mapValueOfType<String>(json, r'categoryName'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        amount: mapValueOfType<double>(json, r'amount'),
        repeatable: IncomeDTOCreateUpdateRepeatableEnum.fromJson(json[r'repeatable']),
        incomeDate: mapDateTime(json, r'incomeDate', r''),
        leadTime: mapValueOfType<int>(json, r'leadTime'),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<IncomeDTOCreateUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncomeDTOCreateUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncomeDTOCreateUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IncomeDTOCreateUpdate> mapFromJson(dynamic json) {
    final map = <String, IncomeDTOCreateUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IncomeDTOCreateUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IncomeDTOCreateUpdate-objects as value to a dart map
  static Map<String, List<IncomeDTOCreateUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IncomeDTOCreateUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IncomeDTOCreateUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class IncomeDTOCreateUpdateRepeatableEnum {
  /// Instantiate a new enum with the provided [value].
  const IncomeDTOCreateUpdateRepeatableEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const WEEKLY = IncomeDTOCreateUpdateRepeatableEnum._(r'WEEKLY');
  static const MONTHLY = IncomeDTOCreateUpdateRepeatableEnum._(r'MONTHLY');
  static const YEARLY = IncomeDTOCreateUpdateRepeatableEnum._(r'YEARLY');
  static const DONT_REPEATS = IncomeDTOCreateUpdateRepeatableEnum._(r'DONT_REPEATS');

  /// List of all possible values in this [enum][IncomeDTOCreateUpdateRepeatableEnum].
  static const values = <IncomeDTOCreateUpdateRepeatableEnum>[
    WEEKLY,
    MONTHLY,
    YEARLY,
    DONT_REPEATS,
  ];

  static IncomeDTOCreateUpdateRepeatableEnum? fromJson(dynamic value) => IncomeDTOCreateUpdateRepeatableEnumTypeTransformer().decode(value);

  static List<IncomeDTOCreateUpdateRepeatableEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncomeDTOCreateUpdateRepeatableEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncomeDTOCreateUpdateRepeatableEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IncomeDTOCreateUpdateRepeatableEnum] to String,
/// and [decode] dynamic data back to [IncomeDTOCreateUpdateRepeatableEnum].
class IncomeDTOCreateUpdateRepeatableEnumTypeTransformer {
  factory IncomeDTOCreateUpdateRepeatableEnumTypeTransformer() => _instance ??= const IncomeDTOCreateUpdateRepeatableEnumTypeTransformer._();

  const IncomeDTOCreateUpdateRepeatableEnumTypeTransformer._();

  String encode(IncomeDTOCreateUpdateRepeatableEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IncomeDTOCreateUpdateRepeatableEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IncomeDTOCreateUpdateRepeatableEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'WEEKLY': return IncomeDTOCreateUpdateRepeatableEnum.WEEKLY;
        case r'MONTHLY': return IncomeDTOCreateUpdateRepeatableEnum.MONTHLY;
        case r'YEARLY': return IncomeDTOCreateUpdateRepeatableEnum.YEARLY;
        case r'DONT_REPEATS': return IncomeDTOCreateUpdateRepeatableEnum.DONT_REPEATS;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IncomeDTOCreateUpdateRepeatableEnumTypeTransformer] instance.
  static IncomeDTOCreateUpdateRepeatableEnumTypeTransformer? _instance;
}


