import 'package:flutter/material.dart';
import 'package:w5_e1menuscard/models/datosMenu.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Mainpage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

int cardselected = 0;

class _MainpageState extends State<Mainpage> {
  Widget cardContainer(DatosMenu menuh) {
    // cardselected = 0;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (menuh.isSelected) {
            menuh.isSelected =
                false; // desmarca el elemento si ya está seleccionado
          } else {
            // Desmarca todos los elementos
            menus.forEach((menu) {
              menu.isSelected = false;
            });
            menuh.isSelected = true; // Marca el elemento seleccionado
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: menuh.isSelected ? Colors.amber : Colors.white,
          // border: menuh.isSelected ? null : Border.all(color: Colors.black),
          border: menuh.isSelected ? Border.all(color: Colors.white) : Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1539735257177-0d3949225f96?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGxhdG8lMjBkZSUyMGNvbWlkYXxlbnwwfHwwfHx8MA%3D%3D"),
                  // image: NetworkImage(menuh.url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuh.menu,
                  style: TextStyle(
                    fontSize: 20,
                    color: menuh.isSelected ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  menuh.dias,
                  style: TextStyle(
                    color: menuh.isSelected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "S/.${menuh.precio}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: menuh.isSelected ? Colors.white : Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DatosMenu> menus = [
    DatosMenu(
      menu: "Menú 1",
      dias: "Lun-Mier-Vier",
      url:
          "https://statics-cuidateplus.marca.com/cms/styles/natural/azblob/2022-09/plato-unico.jpg.webp?itok=0ZB-bG3S",
      precio: 5,
      isSelected: false,
    ),
    DatosMenu(
      menu: "Menú 2",
      dias: "Mar-Jue-Sab",
      url:
          "https://statics-cuidateplus.marca.com/cms/styles/natural/azblob/2022-09/plato-unico.jpg.webp?itok=0ZB-bG3S",
      precio: 6,
      isSelected: false,
    ),
    DatosMenu(
      menu: "Menú 3",
      dias: "Mar-Jue-Sab",
      url:
          "https://statics-cuidateplus.marca.com/cms/styles/natural/azblob/2022-09/plato-unico.jpg.webp?itok=0ZB-bG3S",
      precio: 7,
      isSelected: false,
    ),
    DatosMenu(
      menu: "Menú 4",
      dias: "Mar-Jue-Sab",
      url:
          "https://statics-cuidateplus.marca.com/cms/styles/natural/azblob/2022-09/plato-unico.jpg.webp?itok=0ZB-bG3S",
      precio: 8,
      isSelected: false,
    ),
    // DatosMenu(
    //   menu: "Menú 5",
    //   dias: "Mar-Jue-Sab",
    //   url: "https://statics-cuidateplus.marca.com/cms/styles/natural/azblob/2022-09/plato-unico.jpg.webp?itok=0ZB-bG3S",
    //   precio: 9,
    // ),
  ];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffEEA339),
          title: const Text(
            "SetState Cards Assets App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Selecciona tu mejor elección",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              for (int i = 0; i < menus.length; i++) cardContainer(menus[i]),
            ],
          ),
        ),
      ),
    );
  }
}
