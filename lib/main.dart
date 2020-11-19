import 'package:flutter/material.dart';

import 'package:hooks_riverpod/all.dart';

import 'package:propiedades/src/pages/pages.dart';
import 'package:propiedades/src/themes/styles.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
      ),
      title: 'Propiedades',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'navigation': (context) => NavigationPage(),
      },
    );
  }
}
