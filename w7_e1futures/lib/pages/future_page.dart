import 'package:flutter/material.dart';

class FuturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<String> getTitle() async {
      return Future.delayed(
        Duration(seconds: 4),
        () {
          return "Los inocentes";
        },
      );
    }

    Future<int> getNumber() async {
      return Future.delayed(Duration(seconds: 3), () {
        return 999;
      });
    }

    Future<List<String>> getProducts() async {
      return Future.delayed(Duration(seconds: 3), () {
        return ["Fresa", "Papaya", "Platano", "Manzana"];
      });
    }

    Future<List<Map<String, dynamic>>> getItems() async {
      return Future.delayed(Duration(seconds: 5), () {
        return [
          {"id": 1, "name": "zapatos"},
          {"id": 2, "name": "vestidos"},
          {"id": 3, "name": "zapatillas"},
          {"id": 4, "name": "polos"},
          {"id": 5, "name": "camisas"},
        ];
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Future Page"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getItems(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              List<Map<String, dynamic>> data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(data[index]["name"]);
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),

          // child: FutureBuilder(
          //frente a un setstate este se volvera a ejecutar... si queremos que trabaje de forma independitene (UNA VEZ asi pase cualquier cosa) lo idela seria trabajrlo en un initstate con async aawait y su setstate

          //   future: getTitle(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasData) {
          //       dynamic respuesta = snapshot.data; //dynamic porque estamos probando con getTitle y get Number
          //       return Text(respuesta.toString());
          //     }
          //     // return const Text("Cargando...");
          //     return const SizedBox(
          //       width: 50,
          //       height: 50,
          //       child: CircularProgressIndicator(
          //         color: Colors.pink,
          //         strokeWidth: 5,
          //       ),
          //     );

          //     // print("snapshot: $snapshot");
          //     // print("connection state: ${snapshot.connectionState}");
          //     // print("has data: ${snapshot.hasData}");
          //     // print("has error: ${snapshot.hasError}");
          //     // dynamic variable = snapshot.data;
          //     // return Text(variable.toString());
          //   },
          // ),
          ),
    );
  }
}
