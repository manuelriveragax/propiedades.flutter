import 'package:http/http.dart' as http;
import 'package:propiedades/src/models/login_model.dart';

Future<LoginModel> getAuthToken() async {
  final url = 'http://propiedades2.gleeze.com/api/GetAuthToken';
  final response = await http.post(url, body: {
    'grant_type': 'password',
    'username': 'juan.sanchezaragon@gmail.com',
    'password': 'Adm1n\$20',
  });

  final LoginModel loginResponse = loginResponseFromJson(response.body);

  return loginResponse;
}
