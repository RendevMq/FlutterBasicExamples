import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:w11_e3firetask/pages/login_page.dart';
import 'package:w11_e3firetask/pages/pruebas%20iniciales/buttons_page.dart';
import 'package:w11_e3firetask/pages/pruebas%20iniciales/future_stream_page.dart';
import 'package:w11_e3firetask/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Sirve para que firebase pueda usaar codigo nativo
  await Firebase.initializeApp(); //Iniicaliza
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Task",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme:  GoogleFonts.manropeTextTheme()),
      home: LoginPage(),
    );
  }
}
