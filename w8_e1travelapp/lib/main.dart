import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w8_e1travelapp/pages/home_page.dart';
import 'package:w8_e1travelapp/pages/init_page.dart';
import 'package:w8_e1travelapp/pages/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //Para asegurarme que todo esta inicializado cuando hay carga de recursos como de internet
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme()
      ),
      // home: HomePage(),
      home: InitPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}