import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w6_e1recipes/pages/form_page.dart';
import 'package:w6_e1recipes/pages/home_page.dart';
import 'package:w6_e1recipes/pages/list_view.dart';
import 'package:w6_e1recipes/pages/recipe_page.dart';

void main() {
  runApp(MaterialApp(
    // home: RecipePage(
    //     urlImage: "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    //     title: "Wafles",
    //     description:
    //         "Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.",

    // ),
    home: HomePage(),
    // home: ListViewPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.arapeyTextTheme(),
    ),
  ),);
}
