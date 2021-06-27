import 'package:shared_preferences/shared_preferences.dart';

class User {
  String username;
  String password;

  User._privateConstructor({required this.username, required this.password});

  factory User.createUser(String username, String password) {
    return User._privateConstructor(
      username: username,
      password: password,
    );
  }

  static Future<User> getUser({required String userKey, required String passwordKey}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String userData = preference.getString(userKey) ?? '';
    String passwordData = preference.getString(passwordKey) ?? '';

    return User.createUser(userData, passwordData);
  }

  static Future<void> saveUser({required String userKey, required String userValue, required String passwordKey, required String passwordValue}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(userKey, userValue);
    preference.setString(passwordKey, passwordValue);
  }
}