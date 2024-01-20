import 'package:flutter/material.dart';
import 'package:w5_e2quizzapp/quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(
      home: QuizzPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class QuizzPage extends StatefulWidget {
  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  // const QuizzPage({super.key});
  // int questionIndex = 0;

  List<Icon> scorekeeper = [];

  QuizBrain quizBrain =
      QuizBrain(); //instanciamos la clase dondoe estan las preguntas

  checkAnswear(bool userAnswear) {
    if (quizBrain.isdone() == true) {
      //quiz finalizóo
      Alert(
        context: context,
        type: AlertType.success,
        title: "QuizApp",
        desc: "El quiz ha finalizado",
        buttons: [
          DialogButton(
            child: Text(
              "Aceptar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      quizBrain.restart();
      scorekeeper.clear();
      setState(() {});

      // print("El Quizz ha finalizadoo");
    } else {
      bool correctAnswear = quizBrain.getQuestionAnswear();
      // if (questionIndex >= questions.length - 1) return;
      if (correctAnswear == userAnswear) {
        scorekeeper.add(Icon(Icons.check, color: Colors.greenAccent));
      } else {
        scorekeeper.add(Icon(Icons.close, color: Colors.redAccent));
      }
      quizBrain.nextQuestion();
      // else
      //   questionIndex = 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff001d3d),
        appBar: AppBar(
          title: const Text(
            "My quizz page",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff000814),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              //Los expanded tiene una propiedad de flex
              flex: 5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    // "El hombre llego a la lunaaaaaaaaaaaaaadddddddddddddddddd?",
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  //El material boton tiene la porpiedad Color
                  onPressed: () {
                    checkAnswear(true);
                  },
                  child: Text(
                    "Verdadero",
                  ),
                  color: Colors.greenAccent,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    checkAnswear(false);
                  },
                  child: Text(
                    "Falso",
                  ),
                  color: Colors.redAccent,
                ),
              ),
            ),
            Row(children: scorekeeper),
          ],
        ),
      ),
    );
  }
}
