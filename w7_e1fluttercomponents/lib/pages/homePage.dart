import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w7_e1fluttercomponents/pages/alert_page.dart';
import 'package:w7_e1fluttercomponents/pages/avatar_page.dart';
import 'package:w7_e1fluttercomponents/pages/card_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                  borderRadius:
                      BorderRadius.circular(20), //afecta al contenedor
                  color: Colors.redAccent,
                  image: const DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          "https://i.pinimg.com/736x/89/fb/fd/89fbfd44b0627e0afdbe1954610a37e5.jpg"),
                      fit: BoxFit.fitWidth),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(5, 5),
                        blurRadius: 10),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Flutter Componets",
                // style: TextStyle(
                //   fontSize: 22,
                // ),
                style: GoogleFonts.poppins(fontSize: 24, letterSpacing: 3),
              ),
              const SizedBox(
                width: 200,
                child: Divider(),
              ),
              ItemComponentWidget(title: "Avatar", toPage: AvatarPage()),
              ItemComponentWidget(title: "Alerts", toPage: AlertPage()),
              ItemComponentWidget(title: "Cards", toPage: CardPage()),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemComponentWidget extends StatelessWidget {
  // const ItemComponentWidget({
  //   super.key,
  // });
  String title;
  Widget toPage;
  ItemComponentWidget({required this.title, required this.toPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: Offset(5, 5),
                blurRadius: 12),
          ]),
      child: ListTile(
        //Toma todo el ancho
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => toPage),
          );
        },
        leading: Icon(Icons.check_circle_outline, color: Color(0xff14123d)),
        title: Text(
          title,
          style: GoogleFonts.poppins(),
        ),
        subtitle: Text(
          "Ir al detalle del $title",
          style: GoogleFonts.poppins(),
        ),
        trailing: Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}
