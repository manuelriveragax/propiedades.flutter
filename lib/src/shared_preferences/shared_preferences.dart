import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get bearerToken {
    return _prefs.getString('bearerToken') ?? '';
  }

  set bearerToken(String value) {
    _prefs.setString('bearerToken', value);
  }

  get username {
    return _prefs.getString('username') ?? '';
  }

  set username(String value) {
    _prefs.setString('username', value);
  }
}
