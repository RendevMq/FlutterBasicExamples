import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:w6_e2navicuryhome/models/equiposModel.dart';
import 'package:w6_e2navicuryhome/pages/info_page.dart';
import 'package:w6_e2navicuryhome/pages/slider_page.dart';

class Navicury extends StatelessWidget {
  List<String> espacios = ["A", "B", "C", "D", "E"];

  List<EquiposModel> equipos = [
    EquiposModel(
        svg: "tv",
        name: "TV Cuarto",
        fabricante: "Tv-Samsung",
        modelo: "TP-KINT",
        MAC: "30:40FC:50:PT:40"),
    EquiposModel(
        svg: "garage",
        name: "Garage",
        fabricante: "Garage-Chamberlain",
        modelo: "Smart Garage Opener",
        MAC: "12:34:56:78:9A:BC"),
    EquiposModel(
        svg: "doorhouse",
        name: "Puerta Casa",
        fabricante: "Door-August",
        modelo: "Smart Lock Pro",
        MAC: "FF:EE:DD:CC:BB:AA"),
    EquiposModel(
        svg: "security",
        name: "Camara Afuera",
        fabricante: "Cam-Samsung",
        modelo: "Cam IQ",
        MAC: "A1:B2:C3:D4:E5:F6"),
    EquiposModel(
        svg: "fridge",
        name: "Fridge",
        fabricante: "Fridge-LG",
        modelo: "InstaView",
        MAC: "11:22:33:44:55:66"),
    EquiposModel(
        svg: "fan",
        name: "Ventilador",
        fabricante: "Fan-Dyson",
        modelo: "Pure Cool",
        MAC: "12:AB:34:CD:56:EF"),
    EquiposModel(
        svg: "micro",
        name: "Microfono",
        fabricante: "Mic- Audio-Technica",
        modelo: "AT2020",
        MAC: "78:90:12:34:56:78"),
    EquiposModel(
        svg: "tablet",
        name: "Tablet",
        fabricante: "Tablet-Apple",
        modelo: "iPad Pro",
        MAC: "5C:6D:7E:8F:9A:BC"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Navicury",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(0xff064A88),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Espacios",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 150,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    // color: Colors.lightGreen,
                    ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: espacios.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SliderPage(letter: espacios[index])));
                      },
                      child: Container(
                        width: 120,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 20, // Establece la altura fija aquí
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: Offset(5, 5),
                                blurRadius: 8),
                          ],
                          color: Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            espacios[index],
                            style: TextStyle(
                                color: Color(0xff064A88),
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                height: 30,
              ),
              Text(
                "Equipos Conectados",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18.0,
                    mainAxisSpacing: 18.0,
                    childAspectRatio: 1.5, // Ajusta esto según tus necesidades
                  ),
                  itemCount: equipos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 100, // Establece la altura fija aquí
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(5, 5),
                              blurRadius: 8),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoPage(
                                        title: "${equipos[index].name}",
                                        fabricante:
                                            "${equipos[index].fabricante}",
                                        modelo: "${equipos[index].modelo}",
                                        MAC: "${equipos[index].MAC}",
                                      )),
                            );
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: SvgPicture.asset(
                                  "assets/images/${equipos[index].svg}.svg",
                                  fit: BoxFit.fitHeight,
                                  // height: 80,
                                  colorFilter: ColorFilter.mode(
                                    Color(0xff064A88),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("${equipos[index].name}",
                                  style: TextStyle(
                                      color: Color(0xff064A88), fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
