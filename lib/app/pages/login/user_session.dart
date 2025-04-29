class UserSession {
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;

  UserSession._internal();

  int? userId;
  String? token;

  void clear() {
    userId = null;
    token = null;
  }
}

final userSession = UserSession();
