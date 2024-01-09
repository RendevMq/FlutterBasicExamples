import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Atributos
  int leftDice = 1;
  int rightDice = 1;

  //lo que hace el setstate es volver a ejecutar todo lo que esta
  //dentro del metodo build
  @override
  Widget build(BuildContext context) {
    print("Build!!!");
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("DiceApp"),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: Row(
          children: [
            // Image.asset("assets/images/dice2.png",
            //   width: 200,), No le dremos uun ancho fijo
            Expanded(
                //toma todad la dimension permitida del padre
                flex: 1,
                child: TextButton(
                  //para usarlo como boton
                  onPressed: () {
                    print(leftDice);
                    print("Dado Izquierdo");
                    leftDice = 1 + Random().nextInt(6); //1+ (0-5)
                    rightDice = 1 + Random().nextInt(6);
                    setState(() {
                      //solo aparece disponible en un StatefulWidget
                    }); //con esto le digo que quiero que redibuje el widget
                    print(leftDice);
                  },
                  child: Image.asset(
                    "assets/images/dice$leftDice.png",
                  ),
                )),

            Expanded(
                //toma todad la dimension permitida del padre
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    rightDice = 1 + Random().nextInt(6); //1+ (0-5)
                    leftDice = 1 + Random().nextInt(6);
                    print(rightDice);
                    setState(() {});
                    print("Dado derecho");
                  },
                  child: Image.asset(
                    "assets/images/dice$rightDice.png",
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
