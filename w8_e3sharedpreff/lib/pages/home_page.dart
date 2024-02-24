import 'package:flutter/material.dart';
import 'package:w8_e3sharedpreff/utils/shared_global.dart';
import 'package:w8_e3sharedpreff/widgets/my_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  //guardar sharedpreferences
  // saveSharedPreference() async {
  //para guardar la informacion, creamos una instancia
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   _prefs.setString("fullName", _fullNameController.text);
  //   _prefs.setString("address", _adressController.text);
  //   _prefs.setBool("darkMode", isDarkMode); //true or false
  //   _prefs.setInt("gender", gender); //1 (Masculino) o 2 (Femenino)

  //   print("Guardando en shared preferences....");
  // }

  bool isDarkMode = false;
  int gender = 1;

  //Controladores
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();

  //Instanciamos
  final SharedGlobal _sharedGlobal = SharedGlobal();

  saveSharedPreference2() {
    _sharedGlobal.fullName = _fullNameController.text;
    _sharedGlobal.adress = _adressController.text;
    _sharedGlobal.darkMode = isDarkMode;
    _sharedGlobal.gender = gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(
        title: Text("SharedPreferences App"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Configuracion General",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: "Nombre Completo",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _adressController,
                decoration: InputDecoration(
                  hintText: "Direccion Actual",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Switch(
              //   value: true,
              //   onChanged: (bool valor) {},
              // ),
              SwitchListTile(
                value: isDarkMode,
                title: Text("Modo Oscuro"),
                onChanged: (bool value) {
                  isDarkMode = value;
                  print(isDarkMode);
                  setState(() {});
                },
              ),
              // Radio(
              //   value: 1,
              //   groupValue: 1,
              //   onChanged: (int? value) {},
              // ),
              RadioListTile(
                value: 1, //identificador unico 1
                groupValue:
                    gender, //cuando el group value es igual al value => check
                onChanged: (int? value) {
                  gender = value!;
                  setState(() {});
                },
                title: Text("Masculino"),
              ),
              RadioListTile(
                value: 2, //identificador unico 2
                groupValue: gender, //valor distinto al value => no check
                onChanged: (int? value) {
                  gender = value!;
                  setState(() {});
                },
                title: Text("Femenino"),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // await saveSharedPreference();
                    await saveSharedPreference2();
                    // getSharedPreference();
                    _adressController.text = "";
                    _fullNameController.text = "";
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text(
                    "Guardar Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
