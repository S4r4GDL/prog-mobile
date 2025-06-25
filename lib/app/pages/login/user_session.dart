import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;

  UserSession._internal();

  int? userId;
  String? token;

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    if (userId != null) {
      await prefs.setInt('userId', userId!);
    }
    if (token != null) {
      await prefs.setString('token', token!);
    }
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId');
    token = prefs.getString('token');
  }

  void clear() {
    userId = null;
    token = null;
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('userId');
      prefs.remove('token');
    });
  }
}

final userSession = UserSession();


