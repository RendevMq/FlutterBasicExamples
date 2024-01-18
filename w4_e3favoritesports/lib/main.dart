import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  List<Map<String, dynamic>> sports = [
    {"name": "Gimnasio", "isfavourite": false},
    {"name": "Crossfit", "isfavourite": false},
    {"name": "Correr", "isfavourite": false},
    {"name": "Baloncesto", "isfavourite": false},
    {"name": "Natación", "isfavourite": false},
    {"name": "Golf", "isfavourite": false},
    {"name": "Tenis", "isfavourite": false},
    {"name": "Voley", "isfavourite": false},
  ];

  List<Map<String, dynamic>> listFavoriteSports = [];
  //bool isConTop: esta variable es necesaria, se debe añadir como condicion ya que en favoritos el estilo de los deportes deben ser con fondo blanco y borde naranaj(como estuviese no seleccionado).. sin esta variable el estilo que tomaba era el mismo de arriba luego de seleccionarlo.. medio opaco, es decir todos los deportes favortos tomaban el estilo con fondo najana opaco. Esta variable cuando es true, significa que esta en las seccion de arriba, pero cuando es false.. en la seccion de abajo 

  Widget sportsMapeo(Map<String, dynamic> sport , bool isConTop) {
    print(listFavoriteSports.length);
    return GestureDetector(
      onTap: () {
        sport["isfavourite"] = !sport["isfavourite"];
        if (sport["isfavourite"]) {
          listFavoriteSports = sports
              .where((item) => item["isfavourite"] == true)
              // .toSet()
              .toList();
        } else {
          listFavoriteSports.remove(sport);
          setState(() { });
        }
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: (sport["isfavourite"] && isConTop) ? Colors.white : Color(0xffEEA338)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: (sport["isfavourite"] && isConTop) ? Color(0x80EEA338) : Colors.white,
        ),
        child: Text(
          sport["name"],
          style: TextStyle(
            fontSize: 18,
            color: (sport["isfavourite"] && isConTop) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Favorite Sports",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffEEA338),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cúales son tus deportes favoritos?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Wrap(
                  runSpacing: 8, //espaciado vertical, entre elementos
                  alignment:
                      WrapAlignment.center, // alineacion de los elementos
                  children: sports.map((sport) => sportsMapeo(sport , true)).toList(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                height: 15,
                color: Colors.black,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Mis deportes favoritos son:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: Wrap(
                  runSpacing: 8, //espaciado vertical, entre elementos
                  alignment:
                      WrapAlignment.center, // alineacion de los elementos
                  children: listFavoriteSports.map((sport) => sportsMapeo(sport , false)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
