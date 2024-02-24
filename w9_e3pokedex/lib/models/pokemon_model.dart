class PokemonModel {
  String name;
  String img;
  List<String> types;
  String numPokemon;
  String height;

  PokemonModel(
      {required this.name,
      required this.img,
      required this.types,
      required this.numPokemon,
      required this.height});

  //constructor con nombre de tipo factory
  //en el ejemplodel DB lo nombramos deMapAModel, pero se sule llamar fromJson
  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
      name: json["name"],
      img: json["img"],
      types: List<String>.from(json["type"].map((e) => e)),
      numPokemon: json["num"],
      height: json["height"]);
}
