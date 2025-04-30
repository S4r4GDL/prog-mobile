//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthUserDTO {
  /// Returns a new [AuthUserDTO] instance.
  AuthUserDTO({
    this.email,
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });

  /// E-mail do Usuário onde a solicitação de senha foi enviada. (Campo não será considerado como parâmetro de entrada)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  /// Senha Antiga
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? oldPassword;

  /// Nova Senha
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newPassword;

  /// Confirmar Senha
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? confirmPassword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthUserDTO &&
    other.email == email &&
    other.oldPassword == oldPassword &&
    other.newPassword == newPassword &&
    other.confirmPassword == confirmPassword;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (email == null ? 0 : email!.hashCode) +
    (oldPassword == null ? 0 : oldPassword!.hashCode) +
    (newPassword == null ? 0 : newPassword!.hashCode) +
    (confirmPassword == null ? 0 : confirmPassword!.hashCode);

  @override
  String toString() => 'AuthUserDTO[email=$email, oldPassword=$oldPassword, newPassword=$newPassword, confirmPassword=$confirmPassword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.oldPassword != null) {
      json[r'oldPassword'] = this.oldPassword;
    } else {
      json[r'oldPassword'] = null;
    }
    if (this.newPassword != null) {
      json[r'newPassword'] = this.newPassword;
    } else {
      json[r'newPassword'] = null;
    }
    if (this.confirmPassword != null) {
      json[r'confirmPassword'] = this.confirmPassword;
    } else {
      json[r'confirmPassword'] = null;
    }
    return json;
  }

  /// Returns a new [AuthUserDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthUserDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthUserDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthUserDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthUserDTO(
        email: mapValueOfType<String>(json, r'email'),
        oldPassword: mapValueOfType<String>(json, r'oldPassword'),
        newPassword: mapValueOfType<String>(json, r'newPassword'),
        confirmPassword: mapValueOfType<String>(json, r'confirmPassword'),
      );
    }
    return null;
  }

  static List<AuthUserDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthUserDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthUserDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthUserDTO> mapFromJson(dynamic json) {
    final map = <String, AuthUserDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthUserDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthUserDTO-objects as value to a dart map
  static Map<String, List<AuthUserDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthUserDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthUserDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

