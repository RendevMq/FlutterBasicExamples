class GastoModel {
  int? id;
  String title;
  double price;
  String dateTime;
  String type;

  GastoModel(
      {this.id,
      required this.title,
      required this.price,
      required this.dateTime,
      required this.type});

   Map<String, dynamic> convertirAMAP() => {
        "title": title,
        "price": price,
        "dateTime": dateTime,
        "type": type,
      };
}
