import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  String letter;
  SliderPage({required this.letter});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double valorLuz1 = 20;
  double valorLuz2 = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Espacio: ${widget.letter}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xff064A88),
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
                    "Luz 1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${valorLuz1.toStringAsFixed(1)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Slider(
                    min: 0,
                    max: 100,
                    activeColor: Color(0xff740004),
                    inactiveColor: Color(0xffC8888A),
                    value: valorLuz1,
                    divisions: 1000,
                    onChanged: (double val) {
                      valorLuz1 = val;
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
                    "Luz 2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${valorLuz2.toStringAsFixed(1)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Slider(
                    min: 0,
                    max: 100,
                    activeColor: Color(0xff0046A6),
                    inactiveColor: Color(0xff87A5CF),
                    value: valorLuz2,
                    divisions: 1000,
                    onChanged: (double val) {
                      valorLuz2 = val;
                      // valorCalculado = "";
                      // msg1 = "";
                      // msg2 = "";
                      // url = "";
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
