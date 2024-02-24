import 'package:flutter/material.dart';
import 'package:w9_e2taskdb/pages/home_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TaskDBapp",
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
