class TaskModel {
  String? id;
  String title;
  String description;
  String date;
  String category;
  bool status;

//el id es opcional porque cuando creemos una nueva tarea con el metodo "adddTask" de "my_service_firestore" no le pasamos el id en el modelo que reqquiere como argumento , ya que este se lo asigna el mismo firebase. Pero cuando traemos los ddatos de regreso desde firebase ahi si encademos el id al modelo en el mapeo(ver streambuilder)  de este modo los modelos que mapea para el "ItemTaskWidget" ya ttienen el parametro id, de ese modo ya puedo apuntar a cualquier tarea, con el id para la edicion de algo. 
  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"] ?? "",
        title: json["title"],
        description: json["description"],
        date: json["date"],
        category: json["category"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "date": date, // Convertir la fecha a una cadena ISO
        "category": category,
        "status": status,
      };
}
