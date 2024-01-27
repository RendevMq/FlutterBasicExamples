import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertPage extends StatelessWidget {
  // const AlertPage({super.key});

  showMyAlert(BuildContext mycontext) {
    showDialog(
      context: mycontext,
      builder: (BuildContext context) {
        //la estructura se sabe luego de inspeccionooar , requiere una funciono que te retorna un widget y tiene comooo parametro un BuildContext
        return AlertDialog(
          title: Text("Titulo del Alert"),
          backgroundColor: Colors.white,
          content:
              Text("Hola este es el contenido de mi alert, texto de prueba"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(mycontext); //sacamos al widget
                // Navigator.pop(mycontext);  //nos mandaria al inico, ya que retrocede 2 veces
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  showMyAlert2(BuildContext mycontext) {
    return showDialog(
      context: mycontext,
      builder: (BuildContext mycontext) {
        return AlertDialog(
          //En esta funcion no usamos ni title ni actions porque tiene estilos por defectoo..
          //Se pondra todo en el content
          // title: Text("Hoola"),(
          //en padding podemos darle padding a varias cosoas..con escribir padding.. se ve las opcioneos
          contentPadding: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hola a todos",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87)),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 6,
              ),
              const CircleAvatar(
                backgroundColor: Colors.black12,
                backgroundImage: NetworkImage("https://images.pexels.com/photos/91224/pexels-photo-91224.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              ),
              const Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                ],
              ),
              const SizedBox(height: 6,),
              Text(
                "Hola de nuevo, este es el content , Hola de nuevo, este es el content",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child: const Text("Cancelar"),),
                  const SizedBox(width: 4,),
                  TextButton(onPressed: (){}, child: const Text("Aceptar"),),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alert Page"),
          backgroundColor: Colors.black38,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showMyAlert(context);
                },
                child: Text("Alert 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  showMyAlert2(context);
                },
                child: Text("Alert 2"),
              ),
            ],
          ),
        ));
  }
}
