import 'package:flutter/material.dart';
import 'package:w7_e1futures/pages/container_page.dart';
import 'package:w7_e1futures/pages/future_page.dart';
import 'package:w7_e1futures/pages/practice_future_page.dart';
import 'package:w7_e1futures/pages/profile_page.dart';
import 'package:w7_e1futures/pages/screen_A.dart';
import 'package:w7_e1futures/pages/tab_bar_page.dart';


void main() {
  runApp(MaterialApp(
    // home: ContainerPage(),
    // home: TabBarPage(),
    // home: FuturePage(), 
    // home: ScreenA(), 
    // home: PracticeFuturePage(),
    home:  ProfilePage(), 
    debugShowCheckedModeBanner: false,
  ));
}
