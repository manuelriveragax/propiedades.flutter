part of 'pages.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
    AsyncValue<DespachoModel> data = watch(despachoStateFuture);
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: FaIcon(FontAwesomeIcons.ad), onPressed: () {})],
      ),
      body: data.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('${error.toString()}')),
        data: (data) {
          return new ListView.builder(
            itemCount: data.propiedades.length,
            itemBuilder: (context, index) {
              return new Text('${data.propiedades[index].calle}');
            },
          );
        },
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             MaterialButton(
//                 child: FaIcon(FontAwesomeIcons.download, color: Colors.black, size: 20),
//                 onPressed: () {
//                   getDespacho();
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
