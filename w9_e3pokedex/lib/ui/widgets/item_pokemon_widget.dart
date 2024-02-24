import 'package:flutter/material.dart';
import 'package:w9_e3pokedex/models/pokemon_model.dart';
import 'package:w9_e3pokedex/pages/detail_page.dart';
import 'package:w9_e3pokedex/ui/general/colors.dart';
import 'package:w9_e3pokedex/ui/widgets/item_type_widget.dart';

class ItemPokemonWidget extends StatelessWidget {
  // const ItemPokemonWidget({super.key});

  // String name;
  // String image;
  // List<String> types;

  PokemonModel pokemon;
  Color? color;

  ItemPokemonWidget({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      pokemon: pokemon,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorsPokemon[pokemon.types.first],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 102,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  // Column(
                  //   children:
                  //     types.map((e) => ItemTypeWidget(),).toList()
                  // )
                  ...pokemon.types
                      .map(
                        (tipoString) => ItemTypeWidget(text: tipoString),
                      )
                      .toList()
                ],
              ),
            ),
            Positioned(
              bottom: -5,
              right: -5,
              child: Image.network(
                pokemon.img,
                height: 105,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
