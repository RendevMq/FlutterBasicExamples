import 'package:flutter/material.dart';
import 'package:w11_e2firebase/pages/create_account_page.dart';
import 'package:w11_e2firebase/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:w11_e2firebase/pages/partidos_page.dart';
import 'package:w11_e2firebase/pages/stream_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      title: "Segunda forma de conectar",
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: CreateAccountPage(),
      // home: StreamPage(),
      home: PartidosPage(),
    ),
  );
}
