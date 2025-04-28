//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IncomeListDTO {
  /// Returns a new [IncomeListDTO] instance.
  IncomeListDTO({
    this.id,
    this.category,
    this.name,
    this.description,
    this.amount,
    this.leadTime,
    this.repeatable,
    this.incomeDate,
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
  Category? category;

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
  int? leadTime;

  IncomeListDTORepeatableEnum? repeatable;

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
  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IncomeListDTO &&
    other.id == id &&
    other.category == category &&
    other.name == name &&
    other.description == description &&
    other.amount == amount &&
    other.leadTime == leadTime &&
    other.repeatable == repeatable &&
    other.incomeDate == incomeDate &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (category == null ? 0 : category!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (leadTime == null ? 0 : leadTime!.hashCode) +
    (repeatable == null ? 0 : repeatable!.hashCode) +
    (incomeDate == null ? 0 : incomeDate!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'IncomeListDTO[id=$id, category=$category, name=$name, description=$description, amount=$amount, leadTime=$leadTime, repeatable=$repeatable, incomeDate=$incomeDate, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.category != null) {
      json[r'category'] = this.category;
    } else {
      json[r'category'] = null;
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
    if (this.leadTime != null) {
      json[r'leadTime'] = this.leadTime;
    } else {
      json[r'leadTime'] = null;
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
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    return json;
  }

  /// Returns a new [IncomeListDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IncomeListDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "IncomeListDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "IncomeListDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IncomeListDTO(
        id: mapValueOfType<int>(json, r'id'),
        category: Category.fromJson(json[r'category']),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        amount: mapValueOfType<double>(json, r'amount'),
        leadTime: mapValueOfType<int>(json, r'leadTime'),
        repeatable: IncomeListDTORepeatableEnum.fromJson(json[r'repeatable']),
        incomeDate: mapDateTime(json, r'incomeDate', r''),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<IncomeListDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncomeListDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncomeListDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IncomeListDTO> mapFromJson(dynamic json) {
    final map = <String, IncomeListDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IncomeListDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IncomeListDTO-objects as value to a dart map
  static Map<String, List<IncomeListDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IncomeListDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IncomeListDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class IncomeListDTORepeatableEnum {
  /// Instantiate a new enum with the provided [value].
  const IncomeListDTORepeatableEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const WEEKLY = IncomeListDTORepeatableEnum._(r'WEEKLY');
  static const MONTHLY = IncomeListDTORepeatableEnum._(r'MONTHLY');
  static const YEARLY = IncomeListDTORepeatableEnum._(r'YEARLY');
  static const DONT_REPEATS = IncomeListDTORepeatableEnum._(r'DONT_REPEATS');

  /// List of all possible values in this [enum][IncomeListDTORepeatableEnum].
  static const values = <IncomeListDTORepeatableEnum>[
    WEEKLY,
    MONTHLY,
    YEARLY,
    DONT_REPEATS,
  ];

  static IncomeListDTORepeatableEnum? fromJson(dynamic value) => IncomeListDTORepeatableEnumTypeTransformer().decode(value);

  static List<IncomeListDTORepeatableEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncomeListDTORepeatableEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncomeListDTORepeatableEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IncomeListDTORepeatableEnum] to String,
/// and [decode] dynamic data back to [IncomeListDTORepeatableEnum].
class IncomeListDTORepeatableEnumTypeTransformer {
  factory IncomeListDTORepeatableEnumTypeTransformer() => _instance ??= const IncomeListDTORepeatableEnumTypeTransformer._();

  const IncomeListDTORepeatableEnumTypeTransformer._();

  String encode(IncomeListDTORepeatableEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IncomeListDTORepeatableEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IncomeListDTORepeatableEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'WEEKLY': return IncomeListDTORepeatableEnum.WEEKLY;
        case r'MONTHLY': return IncomeListDTORepeatableEnum.MONTHLY;
        case r'YEARLY': return IncomeListDTORepeatableEnum.YEARLY;
        case r'DONT_REPEATS': return IncomeListDTORepeatableEnum.DONT_REPEATS;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IncomeListDTORepeatableEnumTypeTransformer] instance.
  static IncomeListDTORepeatableEnumTypeTransformer? _instance;
}


