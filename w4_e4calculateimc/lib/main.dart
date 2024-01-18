import 'package:flutter/material.dart';
import 'dart:math';
import 'package:p4calculateimc/model/criterios.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double valorAltura = 150;
  double valorPeso = 60;
  String valorCalculado = "";
  String msg1 = "";
  String msg2 = "";
  String url = "";

  int indexCalculated = 0;

  @override
  Widget build(BuildContext context) {
    List<Criterios> resultados = [
      Criterios(
          valMin: 0,
          valMax: 18.5,
          Mensaje1: "Delgadez o bajo peso",
          Mensaje2:
              "Mantén una dieta equilibrada. Considera incluir alimentos nutritivos y busca orientación sobre hábitos alimenticios saludables.",
          imageUrl:
              "https://i.pinimg.com/736x/26/fa/b2/26fab245d9902fecf04e920a7bc4dcff.jpg"),
      Criterios(
          valMin: 18.5,
          valMax: 24.9,
          Mensaje1: "Peso saludable",
          Mensaje2:
              "¡Felicidades! Estás dentro del rango de peso saludable. Continúa con un estilo de vida activo y come variado.",
          imageUrl:
              "https://img.freepik.com/premium-vector/diet-plan-man-doing-exercise-planning-diet-with-fruit-vegetable-guy-doing-yoga-dietary-eating-meal-planning-nutrition-consultation-healthy-food-sport-health-lifestyle-fitness_458444-1161.jpg?w=2000"),
      Criterios(
          valMin: 24.9,
          valMax: 29.9,
          Mensaje1: "Sobrepeso",
          Mensaje2:
              "Controla las porciones, elige alimentos nutritivos y mantén actividad física regular para un peso saludable.",
          imageUrl:
              "https://img.freepik.com/free-vector/stretch-concept-illustration_114360-7278.jpg?size=338&ext=jpg&ga=GA1.1.1412446893.1704672000&semt=ais"),
      Criterios(
          valMin: 29.9,
          valMax: double.infinity,
          Mensaje1: "Obesidad",
          Mensaje2:
              "La obesidad aumenta graves riesgos. Cambia la dieta y ejercítate más para abordar esta situación.",
          imageUrl:
              "https://cdn.vectorstock.com/i/preview-1x/34/61/chubby-man-running-in-park-overweight-vector-34163461.jpg"),
    ];

    final ButtonStyle style = ElevatedButton.styleFrom(
        // textStyle: const TextStyle(
        //   fontSize: 30,
        //   ),
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1C2433),
          title: Text(
            "Calculate IMC",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Altura",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${valorAltura.toStringAsFixed(1)} cm",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 250,
                      activeColor: Color(0xff740004),
                      inactiveColor: Color(0xffC8888A),
                      value: valorAltura,
                      divisions: 2500,
                      onChanged: (double val) {
                        valorAltura = val;
                        valorCalculado = "";
                        msg1 = "";
                        msg2 = "";
                        url = "";
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Peso",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${valorPeso.toStringAsFixed(1)} kg",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 150,
                      activeColor: Color(0xff0046A6),
                      inactiveColor: Color(0xff87A5CF),
                      value: valorPeso,
                      divisions: 1500,
                      onChanged: (double val) {
                        valorPeso = val;
                        valorCalculado = "";
                        msg1 = "";
                        msg2 = "";
                        url = "";
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    valorCalculado = (valorPeso / pow(valorAltura / 100, 2))
                        .toStringAsFixed(2);
                    for (int i = 0; i < resultados.length; i++)
                      if (double.parse(valorCalculado) > resultados[i].valMin &&
                          double.parse(valorCalculado) <=
                              resultados[i].valMax) {
                        msg1 = resultados[i].Mensaje1;
                        msg2 = resultados[i].Mensaje2;
                        url =  resultados[i].imageUrl;
                        break;
                      }
                    setState(() {});
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  style: style,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(valorCalculado, style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold)),
              Text(msg1, style: TextStyle(
                fontSize: 25,
                color: Color(0xffB21016))),
              Text(
                msg2,
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 180,
                decoration: url.isNotEmpty
                    ? BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.fitHeight),
                          
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
