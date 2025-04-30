//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CredencialDTO {
  /// Returns a new [CredencialDTO] instance.
  CredencialDTO({
    this.id,
    this.name,
    this.login,
    this.email,
    this.roles = const [],
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
    this.refreshExpiresIn,
    this.activeState,
  });

  /// Id do Usuário
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// Nome do Usuário
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Login do Usuário
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? login;

  /// Email do Usário
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  /// Lista de permissões do Usuário
  List<String> roles;

  /// Token de acesso
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accessToken;

  /// Tempo de expiração do token de acesso
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? expiresIn;

  /// Token de refresh
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? refreshToken;

  /// Tempo de expiração do token de refresh
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? refreshExpiresIn;

  /// Indica se o usuário está ativo
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? activeState;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CredencialDTO &&
    other.id == id &&
    other.name == name &&
    other.login == login &&
    other.email == email &&
    _deepEquality.equals(other.roles, roles) &&
    other.accessToken == accessToken &&
    other.expiresIn == expiresIn &&
    other.refreshToken == refreshToken &&
    other.refreshExpiresIn == refreshExpiresIn &&
    other.activeState == activeState;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (login == null ? 0 : login!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (roles.hashCode) +
    (accessToken == null ? 0 : accessToken!.hashCode) +
    (expiresIn == null ? 0 : expiresIn!.hashCode) +
    (refreshToken == null ? 0 : refreshToken!.hashCode) +
    (refreshExpiresIn == null ? 0 : refreshExpiresIn!.hashCode) +
    (activeState == null ? 0 : activeState!.hashCode);

  @override
  String toString() => 'CredencialDTO[id=$id, name=$name, login=$login, email=$email, roles=$roles, accessToken=$accessToken, expiresIn=$expiresIn, refreshToken=$refreshToken, refreshExpiresIn=$refreshExpiresIn, activeState=$activeState]';

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
    if (this.login != null) {
      json[r'login'] = this.login;
    } else {
      json[r'login'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
      json[r'roles'] = this.roles;
    if (this.accessToken != null) {
      json[r'accessToken'] = this.accessToken;
    } else {
      json[r'accessToken'] = null;
    }
    if (this.expiresIn != null) {
      json[r'expiresIn'] = this.expiresIn;
    } else {
      json[r'expiresIn'] = null;
    }
    if (this.refreshToken != null) {
      json[r'refreshToken'] = this.refreshToken;
    } else {
      json[r'refreshToken'] = null;
    }
    if (this.refreshExpiresIn != null) {
      json[r'refreshExpiresIn'] = this.refreshExpiresIn;
    } else {
      json[r'refreshExpiresIn'] = null;
    }
    if (this.activeState != null) {
      json[r'activeState'] = this.activeState;
    } else {
      json[r'activeState'] = null;
    }
    return json;
  }

  /// Returns a new [CredencialDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CredencialDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CredencialDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CredencialDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CredencialDTO(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        login: mapValueOfType<String>(json, r'login'),
        email: mapValueOfType<String>(json, r'email'),
        roles: json[r'roles'] is Iterable
            ? (json[r'roles'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        accessToken: mapValueOfType<String>(json, r'accessToken'),
        expiresIn: mapValueOfType<int>(json, r'expiresIn'),
        refreshToken: mapValueOfType<String>(json, r'refreshToken'),
        refreshExpiresIn: mapValueOfType<int>(json, r'refreshExpiresIn'),
        activeState: mapValueOfType<bool>(json, r'activeState'),
      );
    }
    return null;
  }

  static List<CredencialDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CredencialDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CredencialDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CredencialDTO> mapFromJson(dynamic json) {
    final map = <String, CredencialDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CredencialDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CredencialDTO-objects as value to a dart map
  static Map<String, List<CredencialDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CredencialDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CredencialDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

