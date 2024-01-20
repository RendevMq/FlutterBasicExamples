import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "RecipesApp",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff023047),
        ),
        body: SingleChildScrollView(
          //buscamos que la pantalla sea scroleable , el child es primerdial
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.create),
                    label: Row(
                      //si está el label no puede estar el labeltext
                      mainAxisSize: MainAxisSize.min,
                      children: [Icon(Icons.title), Text("Ingresa título")],
                    ),
                    labelStyle: TextStyle(color: Colors.blue[900]),
                    // labelText: "Ingresa el título",
                    hintText: "Sugerencia de titulo",
                    hintMaxLines: 2, //Si en caso no hay espacio, para que no sallga puntos suspenscivos y lo ponga en 2 lineas
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()                   
                  ),
                ),
                SizedBox(height: 24,),
                TextField(
                  decoration: InputDecoration(
                    // labelText: "Ingresa la preparación",
                    labelStyle: TextStyle(color: Colors.blue[900]),
                    hintText: "Sugerencia de preparación",
                    hintStyle: TextStyle(color: Colors.grey),
                    // prefixIcon: Icon(Icons.people),
                    // prefixText: "Hola",
                    // prefix: Container()
                    // suffix:Container(height: 10, width: 30, color: Colors.green),
                    suffixIcon: Icon(Icons.delete),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    filled: true,
                    fillColor: Colors.red[100],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
