import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // const InputPage({super.key});
  bool isInvisible = true;
  String textGeneral = "";
  final TextEditingController _myController = TextEditingController(text: "Ramon"); //el textoo inicial de este controlador es "Ramon"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                ),
                maxLines: 1,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: "Direccion",
                    hintStyle: TextStyle(color: Colors.blue),
                    label: Text("Direccion Label"),
                    // labelStyle: TextStyle(color: Colors.blue),
                    icon: Icon(Icons.location_on),
                    suffixIcon: Icon(Icons.check_circle_outline),
                    prefixIcon: Icon(Icons.star)),
              ),
              const SizedBox(
                height: 14,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Buscar producto",
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      //por defecto esta en el UNDERLINE
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 3,
                      ),
                    )),
                onChanged: (String value) {
                  print(value);
                },
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      offset: Offset(4, 4),
                      blurRadius: 12)
                ]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Buscar producto...",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black38),
                      filled: true, //estas 2 van de la mano
                      fillColor: Colors.white,
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide:
                              const BorderSide(width: 0, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide:
                              const BorderSide(width: 0, color: Colors.white))),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              TextField(
                obscureText: isInvisible,
                // obscuringCharacter: "X",
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  suffixIcon: IconButton(
                    icon: isInvisible
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      isInvisible = !isInvisible;
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              TextField(
                controller: _myController,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  counterText: "",
                ),
                onTap: () {
                  print("ontap");
                },
                onChanged: (String text) {
                  print(text);
                  textGeneral = text;
                },
                maxLength: 5,
                keyboardType: TextInputType.text,
                cursorColor: Colors.pinkAccent,
                // readOnly: true, //no me permite escribir
                onSubmitted: (String value) {
                  //se activa cada que mandemos el form (check)
                  print(value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // print(textGeneral);
                  print(_myController
                      .text); //mejor hacerlo con los controladores del Tetxtfield
                },
                child: Text(
                  "Obtener valor del text",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // _myController.text = "Julio";
                  _myController.clear();
                },
                child: Text(
                  "Reset",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
