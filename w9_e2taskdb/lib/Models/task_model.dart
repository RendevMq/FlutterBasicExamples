class TaskModel {
  int? id;
  String title;
  String description;
  String status;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory TaskModel.deMapAModel(Map<String, dynamic> map) => TaskModel(
        id: map["id"] ?? 0,
        title: map["title"] ?? "",
        description: map["description"] ?? "",
        status: map["status"] ?? "",
      );
}
