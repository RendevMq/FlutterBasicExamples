import 'package:flutter/material.dart';
import 'package:p2playimages/models/place_model.dart';
import 'dart:math';

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
  String place = "";

  String country = "";

  int index = 0;

  List<PlaceModel> listPlaceModel = [
    PlaceModel(
        url:
            "https://i.pinimg.com/736x/63/18/b1/6318b1dbe5af393f9bb1fe31e317d313.jpg",
        place: "Torre Eiffel",
        country: "Francia - Paris"),
    PlaceModel(
        url:
            "https://i.pinimg.com/736x/96/3c/81/963c81dabe7a8411cefd63def61a5dd7.jpg",
        place: "Chichen Itza",
        country: "México - Yucatán"),
    PlaceModel(
        url:
            "https://i.pinimg.com/736x/79/2e/6b/792e6b36b24f2d115d9ef9956c749009.jpg",
        place: "Machu Picchu",
        country: "Perú - Cusco"),
    PlaceModel(
        url:
            "https://i.pinimg.com/736x/84/9f/ef/849fef9be62d49ed501f2ad049e3a134.jpg",
        place: "La Gran Muralla",
        country: "China"),
    PlaceModel(
        url:
            "https://i.pinimg.com/736x/35/ca/e4/35cae42c4ecfdcefa28a3c9e09c05ae0.jpg",
        place: "El Coliseo",
        country: "Italia - Roma"),
    PlaceModel(
        url:
            "https://i.pinimg.com/736x/81/5a/85/815a858178141d3761021e42260ff2c1.jpg",
        place: "El Cristo Redentor",
        country: "Brasil - Río de Janeiro"),
    PlaceModel(
        url:
            "https://i.pinimg.com/736x/c4/58/58/c45858a9fcefb8f4e5eec6a99819b1b3.jpg",
        place: "Taj Mahal",
        country: "India - Agra"),
  ];

  //Ya no usamos esto..porque no puede inducir a errores al tener que llamarlos de la forma placesList["..."]
  // List<Map<String, String>> placesList = [
  //   {
  //     "place": "Torre Eiffel",
  //     "country": "Francia - Paris",
  //     "url":
  //         "https://i.pinimg.com/736x/63/18/b1/6318b1dbe5af393f9bb1fe31e317d313.jpg"
  //   },
  //   {
  //     "place": "Chichen Itza",
  //     "country": "México - Yucatán",
  //     "url":
  //         "https://i.pinimg.com/736x/96/3c/81/963c81dabe7a8411cefd63def61a5dd7.jpg"
  //   },
  //   {
  //     "place": "Machu Picchu",
  //     "country": "Perú - Cusco",
  //     "url":
  //         "https://i.pinimg.com/736x/79/2e/6b/792e6b36b24f2d115d9ef9956c749009.jpg"
  //   },
  //   {
  //     "place": "Coliseo",
  //     "country": "Italia - Roma",
  //     "url":
  //         "https://i.pinimg.com/736x/35/ca/e4/35cae42c4ecfdcefa28a3c9e09c05ae0.jpg"
  //   },
  //   {
  //     "place": "La Gran Muralla",
  //     "country": "China",
  //     "url":
  //         "https://i.pinimg.com/736x/84/9f/ef/849fef9be62d49ed501f2ad049e3a134.jpg"
  //   },
  //   {
  //     "place": "El Cristo Redentor",
  //     "country": "Brasil - Río de Janeiro",
  //     "url":
  //         "https://i.pinimg.com/736x/81/5a/85/815a858178141d3761021e42260ff2c1.jpg"
  //   },
  //   {
  //     "place": "Taj Mahal",
  //     "country": "India - Agra",
  //     "url":
  //         "https://i.pinimg.com/736x/c4/58/58/c45858a9fcefb8f4e5eec6a99819b1b3.jpg"
  //   },
  // ];


  @override
  void initState() { //lo idael... es lo que se ejecuta antes del build
    index = Random().nextInt(listPlaceModel.length);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //index = Random().nextInt(listPlaceModel.length); //para lograr que la primera imagen sea tambien random.. no es ideal colocarlo aca, lo soluciona pero haria 2 veces el random cada que se ejecute el SetState
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Play here !!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff000B1A),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "7 maravillas del mundo",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 450,
                // width: 500,         
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage("${listPlaceModel[index].url}"),
                    // image: NetworkImage("${placesList[index]["url"]}"),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Container(
              //     height: 300,
              //     width: 300,
              //     child: Image.network(
              //       "${placesList[index]["url"]}",
              //       fit: BoxFit.cover,
              //       alignment: Alignment.topCenter,)),
              Text(
                "Place : $place",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Country : $country",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        place = "${listPlaceModel[index].place}";
                        country = "${listPlaceModel[index].country}";
                        // place = "${placesList[index]["place"]}";
                        // country = "${placesList[index]["country"]}";
                        setState(() {});
                      },
                      child: Text("Completar")),
                  ElevatedButton(
                      onPressed: () {
                        //secuencia en orden
                        // index == listPlaceModel.length - 1
                        //     ? index = 0
                        //     : index++;

                        //de forma random
                        index = Random().nextInt(listPlaceModel.length);
                        // index == placesList.length - 1 ? index = 0 : index++;
                        place = "";
                        country = "";
                        print(index);
                        setState(() {});
                      },
                      child: Text("Next")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
