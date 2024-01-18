import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white30,
              //   backgroundImage: NetworkImage("https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"), //captura la imagen, es un objeto, no un widget
                backgroundImage: AssetImage("assets/images/persona2.jpeg"), //no es widget
               ),
              SizedBox(
                height: 12,
               ),
              Text("Nombre Completo " , 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lobster",  // Añadimos la fuente para el texto
                )),
              SizedBox(
                height: 4,
               ),
              Text("LEARNING FLUTTER",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                )),
              SizedBox(
                width: 130.0,
                child: Divider(
                  thickness: 0.4,
                  color: Colors.white70,
                  // indent: 120,  No es buena practica hacerlo asi
                  // endIndent: 120,                
                ),
              ),
              Card(
                color: Colors.white, 
                margin: EdgeInsets.symmetric(horizontal: 14.0 , vertical: 8.0),
                elevation: 10.5,
                child: ListTile(
                  leading : Icon(
                    Icons.phone,
                    color:Colors.indigo,
                  ),//parte izquiera
                  title: Text("+51 999 888 777"),
                  subtitle: Text("Teléfono"),
                  trailing: Icon(
                    Icons.check_box_outlined,
                    color:Colors.indigo,
                  ),//parte derecha        
                ),
              ), //abarca todo el ancho posible
              Card(
                color: Colors.white, 
                margin: EdgeInsets.symmetric(horizontal: 14.0 , vertical: 8.0),
                elevation: 10.5,
                child: ListTile(
                  leading : Icon(
                    Icons.mail,
                    color:Colors.indigo,
                  ),//parte izquiera
                  title: Text("abcd@gmail.com"),
                  subtitle: Text("Correo"),
                  trailing: Icon(
                    Icons.check_box_outlined,
                    color:Colors.indigo,
                  ),//parte derecha        
                ),
              ), //abarca todo el ancho posible
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/facebook.png",
                    height: 50,),
                  SizedBox(width: 30,),
                  Image.asset("assets/images/instagram.png",
                    height: 50,),
                  SizedBox(width: 30,),
                  Image.asset("assets/images/twitter.png",
                    height: 50,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//stless
