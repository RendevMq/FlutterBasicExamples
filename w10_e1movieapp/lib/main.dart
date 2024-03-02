import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w10_e1movieapp/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MovieApp",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme().apply(
            bodyColor: Colors.white, // Establecer el color del texto a blanco
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
            iconTheme: IconThemeData(color: Colors.white)
          ),
        ),
        home: HomePage());
  }
}
