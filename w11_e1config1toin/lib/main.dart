import 'package:flutter/material.dart';
import 'package:w11_e1firstfirebaseapp/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: "Primera forma de conectar",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
