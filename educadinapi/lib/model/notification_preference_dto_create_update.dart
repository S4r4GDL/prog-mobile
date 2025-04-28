//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationPreferenceDTOCreateUpdate {
  /// Returns a new [NotificationPreferenceDTOCreateUpdate] instance.
  NotificationPreferenceDTOCreateUpdate({
    this.userId,
    this.type,
    this.enabled,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

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
  bool? enabled;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationPreferenceDTOCreateUpdate &&
    other.userId == userId &&
    other.type == type &&
    other.enabled == enabled;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (enabled == null ? 0 : enabled!.hashCode);

  @override
  String toString() => 'NotificationPreferenceDTOCreateUpdate[userId=$userId, type=$type, enabled=$enabled]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.enabled != null) {
      json[r'enabled'] = this.enabled;
    } else {
      json[r'enabled'] = null;
    }
    return json;
  }

  /// Returns a new [NotificationPreferenceDTOCreateUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationPreferenceDTOCreateUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NotificationPreferenceDTOCreateUpdate[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NotificationPreferenceDTOCreateUpdate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationPreferenceDTOCreateUpdate(
        userId: mapValueOfType<int>(json, r'userId'),
        type: mapValueOfType<String>(json, r'type'),
        enabled: mapValueOfType<bool>(json, r'enabled'),
      );
    }
    return null;
  }

  static List<NotificationPreferenceDTOCreateUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationPreferenceDTOCreateUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationPreferenceDTOCreateUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationPreferenceDTOCreateUpdate> mapFromJson(dynamic json) {
    final map = <String, NotificationPreferenceDTOCreateUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationPreferenceDTOCreateUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationPreferenceDTOCreateUpdate-objects as value to a dart map
  static Map<String, List<NotificationPreferenceDTOCreateUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationPreferenceDTOCreateUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationPreferenceDTOCreateUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

