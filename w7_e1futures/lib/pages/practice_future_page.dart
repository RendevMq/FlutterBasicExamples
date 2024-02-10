import 'package:flutter/material.dart';
import 'package:w7_e1futures/pages/container_page.dart';

class PracticeFuturePage extends StatefulWidget {
  @override
  State<PracticeFuturePage> createState() => _PracticeFuturePageState();
}

class _PracticeFuturePageState extends State<PracticeFuturePage> {
  String title = "Hola a todos";

  String mensaje() {
    return "Saludos desde una funcion";
  }

  Future<String> mensaje2() async {
    return Future.delayed(
      Duration(seconds: 3),
      () {
        return "Hola desde un future";
      },
    );
  }

  //La idea es añadir un dispose porque cuandoo el future inicia y si durante ese tiempo navegamos a otra pantalla o por medio de un tab nos pasamos a otro screen.. el future termina pero no como lo esperado(mandad un error en consola de referencia del state, loo que se busca es terminar esta llamada si aun no acaba, es decir, cancelarlo) si volvemos a la pantalla donde esta el future volvera a realizar el init.

  /*El problema principal que estás tratando de resolver es cómo manejar adecuadamente un Future en Flutter cuando la pantalla se desmonta antes de que el Future complete su ejecución. Cuando esto sucede, Flutter arroja un error relacionado con el estado del widget, ya que intenta actualizar un widget que ya no está en el árbol de widgets. */

  //Otra solucion es usar un mounted

  Future getMandarina() async {
    // title = await mensaje2();
    // setState(() {});

    final result = await mensaje2();
    if (mounted) { //si esta montado
      setState(() {
        title = result;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initttttttttttt");
    //NO SE PUEDE
    // title = await mensaje2();

    //SI SE PUEDE OPCION 1
    // mensaje2().then((value) {
    //   title = value;
    //   setState(() {});
    // });

    //SI SE PUEDE OPCION 2
    getMandarina();
  }

  // Future<void> mensaje3() async {}
  @override
  Widget build(BuildContext context) {
    print("buildddddddddd");
    //esto esta mal
    // mensaje2().then((value) {
    //   print(value);
    //   print("este es el buclkeeeeeeeeeeeeeeeeeeeeeeeee");
    //   title = value;
    //   setState(() {});
    // });
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("FUTURES"),
      // ),
      body: Column(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ContainerPage(),
                  ),
                );
              },
            child: Container(
              color: Colors.redAccent,
              height: 50,
              width: 100,
              child: Center(
                  child: Text(
                "Navegar",
                style: TextStyle(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
