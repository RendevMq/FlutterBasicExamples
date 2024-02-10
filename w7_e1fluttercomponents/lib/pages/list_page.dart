import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  // const ListPage({super.key});

  List<String> heroes = [
    "Batman",
    "Superman",
    "Wonder Woman",
    "Flash",
    "Aquaman"
  ];

  Map<String, dynamic> teamMap = {
    "squadName": "Super hero squad",
    "homeTown": "Metro City",
    "formed": 2016,
    "secretBase": "Super tower",
    "active": true,
    "members": [
      {
        "name": "Batman",
        "image":
            "https://www.lacasadeel.net/wp-content/uploads/2021/11/BATMAN-ENCABEZADO.jpg",
        "age": 29,
        "secretIdentity": "Dan Jukes",
        "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]
      },
      {
        "name": "Superman",
        "image":
            "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/980px/public/media/image/2021/06/superman-2354819.jpg",
        "age": 39,
        "secretIdentity": "Jane Wilson",
        "powers": [
          "Million tonne punch",
          "Damage resistance",
          "Superhuman reflexes"
        ]
      },
      {
        "name": "Wonder Woman",
        "image":
            "https://dam.smashmexico.com.mx/wp-content/uploads/2021/10/wonder-woman-historia-comics-escenciales-cover.jpg",
        "age": 1000000,
        "secretIdentity": "Unknown",
        "powers": [
          "Immortality",
          "Heat Immunity",
          "Inferno",
          "Teleportation",
          "Interdimensional travel"
        ]
      },
      {
        "name": "Batman",
        "image":
            "https://www.lacasadeel.net/wp-content/uploads/2021/11/BATMAN-ENCABEZADO.jpg",
        "age": 29,
        "secretIdentity": "Dan Jukes",
        "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]
      },
      {
        "name": "Superman",
        "image":
            "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/980px/public/media/image/2021/06/superman-2354819.jpg",
        "age": 39,
        "secretIdentity": "Jane Wilson",
        "powers": [
          "Million tonne punch",
          "Damage resistance",
          "Superhuman reflexes"
        ]
      },
      {
        "name": "Wonder Woman",
        "image":
            "https://dam.smashmexico.com.mx/wp-content/uploads/2021/10/wonder-woman-historia-comics-escenciales-cover.jpg",
        "age": 1000000,
        "secretIdentity": "Unknown",
        "powers": [
          "Immortality",
          "Heat Immunity",
          "Inferno",
          "Teleportation",
          "Interdimensional travel"
        ]
      },
    ]
  };

  showDetailHeroe(BuildContext mycontext, Map<String, dynamic> mapaInfo) {
    showDialog(
      context: mycontext,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(mapaInfo["name"]),
              const SizedBox(
                width: 100,
                child: Divider(),
              ),
              ClipRRect(
                // borderRadius:const BorderRadius.all(Radius.circular(50)),
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  mapaInfo["image"],
                  width: 200,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(mapaInfo["secretIdentity"]),
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
        title: const Text("List page"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: teamMap["members"].length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                print(teamMap["members"][index]);
                showDetailHeroe(context, teamMap["members"][index]);
              },
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(teamMap["members"][index]["image"]),
              ),
              title: Text(teamMap["members"][index]["name"]),
              subtitle: Text(teamMap["members"][index]["secretIdentity"]),
              trailing: const Icon(Icons.view_carousel),
            );
          }),

      // body:ListView.builder(
      //   itemCount: heroes.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     print(index);
      //     return ListTile(
      //       leading: CircleAvatar(
      //         child: Text(heroes[index][0]),
      //       ),
      //       title: Text(heroes[index]),
      //     );
      //   },
      // ),

      // body: ListView.builder( //Solo los widgets de la pantalla se construyen, los que no se ven aun no por eso que el print no llega hasta 1000 , a diferencia de un List.generate
      //   itemCount: 1000,
      //   itemBuilder: (BuildContext context, int index) {
      //     print(index);
      //     return Text("Hola");
      //   },
      // ),

      // body: ListView(

      //   children: [
      //     Container(
      //       height: 200,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       height: 200,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       height: 200,
      //       color: Colors.yellow,
      //     ),
      //     Container(
      //       height: 200,
      //       color: Colors.pink,
      //     ),
      //     Container(
      //       height: 200,
      //       color: Colors.white,
      //     ),
      //   ],
      // )
    );
  }
}
