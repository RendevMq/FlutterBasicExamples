import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  String title;
  String fabricante;
  String modelo;
  String MAC;
  InfoPage({
    required this.title,
    required this.fabricante,
    required this.modelo,
    required this.MAC,
  });

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  // const SlidersPaage({super.key});
  String textoButton = "Encender";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipo: ${widget.title}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xff064A88),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fabricante",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${widget.fabricante}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Modelo",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${widget.modelo}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MAC",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${widget.MAC}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 54,
            ),
            GestureDetector(
              onTap: () {
                if (textoButton == "Encender") {
                  textoButton = "Apagar";
                  setState(() {});
                } else {
                  textoButton = "Encender";
                  setState(() {});
                }
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff064A88),
                    width: 2,
                  ),
                  color: Colors.white, // Color de fondo
                ),
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Center(
                  child: Text(
                    "$textoButton",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff064A88),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
