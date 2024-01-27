import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  // const ListViewPage({super.key});

  List<String> names = ["fsefse", "sefsef", "dgdrgdg", "dfbdfbdb"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
          ),
          body: Column(
            children: [
              Text("Contenedores abajo"),
              Expanded(
                // height: 600, Si quieero una altura fija puedoo usar el Container, y darle un Heigh
                child: ListView.builder(
                  //silimar al domVirtual de react, En lugar de construir todos los elementos de la lista de una vez, ListView.builder construye solo los elementos que actualmente son visibles en la pantalla, lo que mejora el rendimiento en listas grandes.
                  itemCount: 1000,
                  itemBuilder: (context, index) {
                    //el context es de tipo BuildContext y el index Int
                    //Aca puedo poner lógica
                    print(
                        index); // a medida que haga scroll se ira printeando los nuevos elementos que se conotruyen, no lo hace tdoo de golpe
                    
                    return Container(
                        height: 200,
                        width: 500,
                        margin: EdgeInsets.all(20),
                        color: Colors.redAccent);
                  },
                ),
              ),
            ],
          )
          // body: ListView(
          //   children: [
          //     ...List.generate(names.length , (index) => Text(names[index])),
          //     Container(height: 200, width: 500, color: Colors.redAccent),
          //   ],
          // ),
          ),
    );
  }
}
