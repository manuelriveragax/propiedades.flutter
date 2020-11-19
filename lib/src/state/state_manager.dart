import 'package:hooks_riverpod/all.dart';
import 'package:propiedades/src/models/despacho_model.dart';
import 'package:propiedades/src/models/login_model.dart';
import 'package:propiedades/src/services/get_despacho.dart';
import 'package:propiedades/src/services/get_auth_token.dart';

final userStateFuture = FutureProvider<LoginModel>((ref) async {
  return getAuthToken();
});

final despachoStateFuture = FutureProvider<DespachoModel>((ref) async {
  return getDespacho();
});
