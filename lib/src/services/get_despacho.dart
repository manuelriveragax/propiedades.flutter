import 'package:http/http.dart' as http;
import 'package:propiedades/src/models/despacho_model.dart';

Future<DespachoModel> getDespacho() async {
  final bearerToken =
      'E0QbWSRLD-KkhXaerBaQYHtR8fYQRL6aAFYFqbA1cVYFf3BIO9NeY7V6qxF49Efg_KDsqChTSwQX3OU9STsGgRA5pLufnL366u8Aen2usvz0vnfEB1hzGHhIUyh_KHmct5eG1KgFXxwoj9r9PmmgIk3IDmVKqSRgejLs4CEPUcHlIaO-RqRqosS7HqJ6I_8nN9KgrmUH6KDBooBdhkoKoYwwzzRJ8JCWYp2PGbA5lcVwc1GPa3d6n63VSQFbtLUsrE41S762ssm9VJCDDfXUIiDyOfkJERMUSmtX_rLHWlPvlLguPTLFwmEqkGvCwE8lHzkuaY_vJD_zMZGu5B3LtbpP-14dGSeFMzZhnEFKPPVMmWcXXC5jqGaV2sQT0ETv3b5Gyp5k3rxneDrWSdpBi9r9-y1klf0dPkDk2v7ULd-Y6J7Tfno6ODvn5jrjlGAiCqC3ZPPvlTOaPTpA35RqS93i9ccx8QYQwc23RtAleMuJOS7Jd2nMnobV9T6DN1PnolfxlHwF2k-ZgtOCBhyDfNTpw2amqgczuZtJL5DtXm4';

  final url = 'http://propiedades2.gleeze.com/api/services/getDespacho';

  final response = await http.post(url, headers: {
    'Authorization': 'Bearer $bearerToken',
  });

  final DespachoModel despachoResponse = getDespachoModelFromJson(response.body);

  print(despachoResponse);
  print(despachoResponse.propiedades[0]);

  return despachoResponse;
}
