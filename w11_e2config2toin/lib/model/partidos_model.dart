class PartidoModel {
  String? partido;
  String representante;
  String image;
  String descripcion;
  int votantes;

  PartidoModel(
      {this.partido,
      required this.representante,
      required this.descripcion,
      required this.image,
      required this.votantes});

  factory PartidoModel.fromJson(Map<String, dynamic> json) => PartidoModel(
        partido: json["partido"] ?? "",
        representante: json["representante"],
        descripcion: json["descripcion"],
        image: json["image"],
        votantes: json["votantes"],
      );
}
