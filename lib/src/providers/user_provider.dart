part of 'providers.dart';

class UserProvider {
  final _prefs = new UserPreferences();

  Future<LoginModel> loginAttempt(String username, String password) async {
    final url = 'http://propiedades2.gleeze.com/api/GetAuthToken';
    final authData = {
      'grant_type': 'password',
      'username': username,
      'password': password,
    };

    final resp = await http.post(url, body: authData);

    final loginResp = loginResponseFromJson(resp.body);

    if (loginResp.accessToken != null) {
      _prefs.bearerToken = loginResp.accessToken.trim();
      _prefs.username = loginResp.userName.trim();
      return loginResp;
    }

    return null;
  }
}

final userProvider = Provider((ref) => UserProvider());
