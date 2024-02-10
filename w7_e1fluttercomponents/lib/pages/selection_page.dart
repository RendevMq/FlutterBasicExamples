import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  TextEditingController dateController = TextEditingController();

  selectedDate() async {
    //CTRL + CLICK y se ve que es un Future y devuelve un DateTime, de ahi se deduce la estructura.
    DateTime? dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    // print(dateSelected);
    dateController.text = dateSelected.toString().substring(0, 10);
  }

  int selectedValue = 1;
  List<String> superheroes = ["Batman", "Superman", "Wonder Woman", "FLash"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selectiono Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: dateController,
              decoration:
                  const InputDecoration(hintText: "Fecha de nacimiento"),
              onTap: () {
                FocusScope.of(context).requestFocus(
                    FocusNode()); //funcion que deniega la aparicion del teclado
                print("Aperturando el DatePicker");
                selectedDate();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // width: 300,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: Offset(4, 4),
                    blurRadius: 12,
                  )
                ],
              ),

              child: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
                isExpanded: true,
                underline:
                    Container(), //recibe cualquier wiodget vacio para borrar la linea
                value: selectedValue, //valor por defecto
                items: [
                  ...List.generate(superheroes.length, (index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text(superheroes[index]),
                    );
                  }),
                ],

                onChanged: (int? value) {
                  selectedValue = value!;
                  print(value);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
