// part of 'pages.dart';

// class DespachoPage extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final despacho = useProvider(futureDespachoProvider);

//     return despacho.when(
//       error: (e, s) => Text('Error: $e'),
//       loading: () => Center(child: CircularProgressIndicator(backgroundColor: primaryColor)),
//       data: (data) {
//         return SafeArea(
//           child: RefreshIndicator(
//             onRefresh: () => context.refresh(despachoProvider).getDespacho(),
//             color: primaryColor,
//             backgroundColor: secondaryColor,
//             displacement: height * 0.10,
//             child: ListView.builder(
//               physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//               itemCount: data.propiedades.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20.0),
//                     child: ListTile(
//                       tileColor: primaryColor,
//                       title: Text(data.propiedades[index].alias, style: TextStyle(color: secondaryColor)),
//                       subtitle: Text(data.propiedades[index].calle, style: TextStyle(color: secondaryColor)),
//                       leading: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         child: Icon(Icons.house, color: secondaryColor, size: bigIcon),
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.navigation, color: secondaryColor, size: bigIcon),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             CupertinoPageRoute(
//                               builder: (context) => PropiedadesPage(),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
