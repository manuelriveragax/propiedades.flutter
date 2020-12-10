import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/all.dart';

import 'package:propiedades/src/pages/pages.dart';
import 'package:propiedades/src/shared_preferences/shared_preferences.dart';
import 'package:propiedades/src/themes/styles.dart';

import 'src/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
      ),
      title: 'Propiedades',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
        'membresias': (context) => VentaMembresiasPage(),
        'servicios': (context) => VentaServiciosPage(),
        'articulos': (context) => VentaArticulosPage(),
        'agenda': (context) => AgendaServiciosPage(),
        'propiedades': (context) => PropiedadesPage(),
        'carrito': (context) => CarritoComprasPage(),
        'mensajes': (context) => MensajesPage(),
        'profile': (context) => ProfilePage(),

        // 'despacho': (context) => DespachoPage(),
        // 'navigation': (context) => NavigationPage(),
      },
    );
  }
}
