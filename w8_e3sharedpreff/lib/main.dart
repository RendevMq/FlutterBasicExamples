import 'package:flutter/material.dart';
import 'package:w8_e3sharedpreff/pages/home_page.dart';
import 'package:w8_e3sharedpreff/utils/shared_global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Antes de ejecutar el aplicativo MyApp, creamos una instancia de SharedGlobal
  SharedGlobal preferences = SharedGlobal();
  //Inicializamos solo una vez a nuestra preferencia SharedGlobal
  preferences.initSharedPreference();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shared Preferences App",
      home: HomePage(),
    );
  }
}
