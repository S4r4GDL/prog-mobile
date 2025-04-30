//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SearchFieldValue {
  /// Returns a new [SearchFieldValue] instance.
  SearchFieldValue({
    this.name,
    this.type,
    this.value,
    this.searchType,
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
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  SearchFieldValueSearchTypeEnum? searchType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchFieldValue &&
    other.name == name &&
    other.type == type &&
    other.value == value &&
    other.searchType == searchType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (value == null ? 0 : value!.hashCode) +
    (searchType == null ? 0 : searchType!.hashCode);

  @override
  String toString() => 'SearchFieldValue[name=$name, type=$type, value=$value, searchType=$searchType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    if (this.searchType != null) {
      json[r'searchType'] = this.searchType;
    } else {
      json[r'searchType'] = null;
    }
    return json;
  }

  /// Returns a new [SearchFieldValue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SearchFieldValue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SearchFieldValue[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SearchFieldValue[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SearchFieldValue(
        name: mapValueOfType<String>(json, r'name'),
        type: mapValueOfType<String>(json, r'type'),
        value: mapValueOfType<String>(json, r'value'),
        searchType: SearchFieldValueSearchTypeEnum.fromJson(json[r'searchType']),
      );
    }
    return null;
  }

  static List<SearchFieldValue> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchFieldValue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchFieldValue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SearchFieldValue> mapFromJson(dynamic json) {
    final map = <String, SearchFieldValue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SearchFieldValue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SearchFieldValue-objects as value to a dart map
  static Map<String, List<SearchFieldValue>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SearchFieldValue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SearchFieldValue.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class SearchFieldValueSearchTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const SearchFieldValueSearchTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const CONTAINS = SearchFieldValueSearchTypeEnum._(r'CONTAINS');
  static const DOES_NOT_CONTAIN = SearchFieldValueSearchTypeEnum._(r'DOES_NOT_CONTAIN');
  static const EQUAL = SearchFieldValueSearchTypeEnum._(r'EQUAL');
  static const NOT_EQUAL = SearchFieldValueSearchTypeEnum._(r'NOT_EQUAL');
  static const BEGINS_WITH = SearchFieldValueSearchTypeEnum._(r'BEGINS_WITH');
  static const DOES_NOT_BEGIN_WITH = SearchFieldValueSearchTypeEnum._(r'DOES_NOT_BEGIN_WITH');
  static const ENDS_WITH = SearchFieldValueSearchTypeEnum._(r'ENDS_WITH');
  static const DOES_NOT_END_WITH = SearchFieldValueSearchTypeEnum._(r'DOES_NOT_END_WITH');
  static const NUL = SearchFieldValueSearchTypeEnum._(r'NUL');
  static const NOT_NULL = SearchFieldValueSearchTypeEnum._(r'NOT_NULL');
  static const GREATER_THAN = SearchFieldValueSearchTypeEnum._(r'GREATER_THAN');
  static const GREATER_THAN_EQUAL = SearchFieldValueSearchTypeEnum._(r'GREATER_THAN_EQUAL');
  static const LESS_THAN = SearchFieldValueSearchTypeEnum._(r'LESS_THAN');
  static const LESS_THAN_EQUAL = SearchFieldValueSearchTypeEnum._(r'LESS_THAN_EQUAL');
  static const ANY = SearchFieldValueSearchTypeEnum._(r'ANY');
  static const ALL = SearchFieldValueSearchTypeEnum._(r'ALL');

  /// List of all possible values in this [enum][SearchFieldValueSearchTypeEnum].
  static const values = <SearchFieldValueSearchTypeEnum>[
    CONTAINS,
    DOES_NOT_CONTAIN,
    EQUAL,
    NOT_EQUAL,
    BEGINS_WITH,
    DOES_NOT_BEGIN_WITH,
    ENDS_WITH,
    DOES_NOT_END_WITH,
    NUL,
    NOT_NULL,
    GREATER_THAN,
    GREATER_THAN_EQUAL,
    LESS_THAN,
    LESS_THAN_EQUAL,
    ANY,
    ALL,
  ];

  static SearchFieldValueSearchTypeEnum? fromJson(dynamic value) => SearchFieldValueSearchTypeEnumTypeTransformer().decode(value);

  static List<SearchFieldValueSearchTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchFieldValueSearchTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchFieldValueSearchTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SearchFieldValueSearchTypeEnum] to String,
/// and [decode] dynamic data back to [SearchFieldValueSearchTypeEnum].
class SearchFieldValueSearchTypeEnumTypeTransformer {
  factory SearchFieldValueSearchTypeEnumTypeTransformer() => _instance ??= const SearchFieldValueSearchTypeEnumTypeTransformer._();

  const SearchFieldValueSearchTypeEnumTypeTransformer._();

  String encode(SearchFieldValueSearchTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SearchFieldValueSearchTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SearchFieldValueSearchTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'CONTAINS': return SearchFieldValueSearchTypeEnum.CONTAINS;
        case r'DOES_NOT_CONTAIN': return SearchFieldValueSearchTypeEnum.DOES_NOT_CONTAIN;
        case r'EQUAL': return SearchFieldValueSearchTypeEnum.EQUAL;
        case r'NOT_EQUAL': return SearchFieldValueSearchTypeEnum.NOT_EQUAL;
        case r'BEGINS_WITH': return SearchFieldValueSearchTypeEnum.BEGINS_WITH;
        case r'DOES_NOT_BEGIN_WITH': return SearchFieldValueSearchTypeEnum.DOES_NOT_BEGIN_WITH;
        case r'ENDS_WITH': return SearchFieldValueSearchTypeEnum.ENDS_WITH;
        case r'DOES_NOT_END_WITH': return SearchFieldValueSearchTypeEnum.DOES_NOT_END_WITH;
        case r'NUL': return SearchFieldValueSearchTypeEnum.NUL;
        case r'NOT_NULL': return SearchFieldValueSearchTypeEnum.NOT_NULL;
        case r'GREATER_THAN': return SearchFieldValueSearchTypeEnum.GREATER_THAN;
        case r'GREATER_THAN_EQUAL': return SearchFieldValueSearchTypeEnum.GREATER_THAN_EQUAL;
        case r'LESS_THAN': return SearchFieldValueSearchTypeEnum.LESS_THAN;
        case r'LESS_THAN_EQUAL': return SearchFieldValueSearchTypeEnum.LESS_THAN_EQUAL;
        case r'ANY': return SearchFieldValueSearchTypeEnum.ANY;
        case r'ALL': return SearchFieldValueSearchTypeEnum.ALL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SearchFieldValueSearchTypeEnumTypeTransformer] instance.
  static SearchFieldValueSearchTypeEnumTypeTransformer? _instance;
}


