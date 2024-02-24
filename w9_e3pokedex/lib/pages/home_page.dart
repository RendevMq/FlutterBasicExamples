import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:w9_e3pokedex/models/pokemon_model.dart';
import 'package:w9_e3pokedex/ui/widgets/item_pokemon_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  List pokemons = [];
  List<PokemonModel> pokemonModel = [];

  //metodo para probar el consumo de los servicios
  //si modificamos o agregamos nuevas atribuots al modelo pokemon para que los reciba reinicciar el app para que se carguen de nuevo loss datos y se asigne a ese nuevo atributo..
  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response =
        await http.get(_uri); //capturamos la respuesta de la peticion
    //print(response);
    //print(response.statusCode);
    //print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      //pokemons = myMap["pokemon"]; //el body es un string

      pokemonModel =
          myMap["pokemon"].map<PokemonModel>((item) => PokemonModel.fromJson(item)).toList();
      print(pokemonModel);

      // pokemons.forEach((element) {
      //   print(element["type"]);
      // });
      setState(
          () {}); //mande a llamar a dibujar toddo el build nuevamente cuando ya cargaron los datos
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Pokedex",
                    style:
                        TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 12,
                ),
                GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.35,
                  children: pokemonModel
                      .map((e) => ItemPokemonWidget(
                            // name: e.name,
                            // image: e.img,
                            // types: List<String>.from(e.types.map((item) =>
                            //     item)),
                            pokemon: e,
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
