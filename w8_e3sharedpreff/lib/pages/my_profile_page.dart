import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:w8_e3sharedpreff/utils/shared_global.dart';

class MyProfilePage extends StatefulWidget {
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  // const MyProfilePage({super.key});

  // String fullName = '';
  // String address = '';
  // bool darkMode = false;
  // int gender = 1;

  // getSharedPreference() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   fullName = _prefs.getString("fullName") ?? "-";
  //   address = _prefs.getString("address") ?? "-";
  //   darkMode = _prefs.getBool("darkMode") ?? false;
  //   gender = _prefs.getInt("gender") ?? 0;
    // print("Full Name: $fullName");
    // print("Adress: $address");
    // print("DarkMode: $darkMode");
    // print("Gender: $gender");
    // setState(() {});
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getSharedPreference();
  //   super.initState();
  // }

  
  //Instanciamos
  final SharedGlobal _sharedGlobal = SharedGlobal();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Mi informacion",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(_sharedGlobal.fullName),
              subtitle: Text("Nombre Completo"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(_sharedGlobal.adress),
              subtitle: Text("Direccion"),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text(_sharedGlobal.darkMode ? "Activo" : "Desactivo"),
              subtitle: Text("Modo Oscuro"),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit_outlined),
              title: Text(_sharedGlobal.gender == 1 ? "Masculino" : "Femenino"),
              subtitle: Text("Género"),
            ),
          ],
        ),
      ),
    );
  }
}
