part of 'providers.dart';

class DespachoProvider {
  Future<DespachoModel> getDespacho() async {
    final _prefs = new UserPreferences();

    final bearerToken = _prefs.bearerToken;

    final url = 'http://propiedades2.gleeze.com/api/services/getDespacho';

    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    final DespachoModel despachoResponse = despachoModelFromJson(response.body);

    return despachoResponse;
  }
}

final despachoProvider = Provider((ref) => DespachoProvider());

final futureDespachoProvider = FutureProvider<DespachoModel>((ref) async {
  final despachoResponse = ref.read(despachoProvider);
  return despachoResponse.getDespacho();
});
