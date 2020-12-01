part of 'providers.dart';

final propiedadesProvider = FutureProvider<List<Propiedade>>((ref) async {
  List<Propiedade> propiedades = [];

  final despachoResponse = ref.read(futureDespachoProvider);
  despachoResponse.data.value.propiedades.forEach((propiedad) {
    propiedades.add(propiedad);
  });

  return propiedades;
});
