import 'package:flutter/material.dart';
import 'package:w7_e2whatsappclon/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: "WhatsApp Clone",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Color(0xff065E52),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22
            ),
            // iconTheme: IconThemeData(color: Colors.white),
            foregroundColor: Colors.white
            ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff01C851),
          foregroundColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white, 
          unselectedLabelColor: Colors.white54, 
        ),
      ),
    ),
  );
}
