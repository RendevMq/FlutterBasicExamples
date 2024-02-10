import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:w8_e1travelapp/widgets/card2_widget.dart';
import 'package:w8_e1travelapp/widgets/card3_widget.dart';
import 'package:w8_e1travelapp/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> _saveContador() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("counter",
        contador); //vas a guardar en el key counter la variable contador
  }

  Future<void> _getContador() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    //contador = _prefs.getInt("counter"); //al inicio , antes de aumentar el contador.. la llave no existe (counter) porque no se llamo a _saveContador.. por eso es que sale error en este casoo
    contador = _prefs.getInt("counter") ?? 0;
    setState(() {});
  }

  Future<void> setCerrarApp() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("yaInicio", false);
    print(_prefs.get("yaInicio"));
  }

  int contador = 0;

  @override
  void initState() {
    _getContador();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contador++;
          _saveContador();
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.cyan,
        ),
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.rocket,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "DiscountTour",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find the best tour: ${contador.toString()}",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: ()  {
                      //await setCerrarApp();
                      //exit(0);  //libreria 'dart:io'
                      setCerrarApp().then((value) {
                        exit(0);
                      });
                    },
                    child: Text("CERRAR APP"),
                  ),
                ),
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis finibus tincidunt libero, quis rhoncus leo tempor",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Country",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardWidget(),
                    CardWidget(),
                    CardWidget(),
                    CardWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Card2Widget(),
              Card2Widget(),
              Card2Widget(),
              Card2Widget(),
              Card2Widget(),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    Card3Widget(),
                    Card3Widget(),
                    Card3Widget(),
                    Card3Widget(),
                    Card3Widget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
