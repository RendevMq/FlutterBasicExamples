import 'package:flutter/material.dart';
import 'package:w9_e3pokedex/models/pokemon_model.dart';
import 'package:w9_e3pokedex/ui/general/colors.dart';
import 'package:w9_e3pokedex/ui/widgets/item_data_widget.dart';
import 'package:w9_e3pokedex/ui/widgets/item_type_widget.dart';

class DetailPage extends StatelessWidget {
  // const DetailPage({super.key});

  PokemonModel pokemon;

  DetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.types.first],
      appBar: AppBar(
        // leading: ,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          //Pokebola de fondo
          Positioned(
            top: height * 0.1,
            right: -30,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 200,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: pokemon.types.map((e) => ItemTypeWidget(text: e),).toList(),
                    ),
                  ],
                ),
                Text(
                  "#${pokemon.numPokemon}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //Data del Pokemon
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            Text(
                              "About Pokemon",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            ItemDataWidget(title: "Height", data: pokemon.height),
                            ItemDataWidget(title: "Height", data: "1.5m"),
                            ItemDataWidget(title: "Height", data: "1.5m"),
                            ItemDataWidget(title: "Height", data: "1.5m"),
                          ],
                        ),
                      ),
                      //Imagen del pokmon
                      Positioned.fill(
                        top: -100,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                              pokemon.img),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
