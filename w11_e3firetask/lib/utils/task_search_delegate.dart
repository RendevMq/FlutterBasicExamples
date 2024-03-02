import 'package:flutter/material.dart';
import 'package:w11_e3firetask/models/task_model.dart';
import 'package:w11_e3firetask/widgets/item_task_widget.dart';

//hereddamos de ua clase padre
//Debido a que heredamos este nos pide 4 metodos requeridos
//antes de escribir le dadmos al foco de nuestraa clase y pulsamos en "Create 4 missing overrides"
class TaskSearchDelegate extends SearchDelegate {

  List<TaskModel> tasks;
  TaskSearchDelegate({required this.tasks});

  //====Modificamos el texto como plceholder======//
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Buscar tarea...";

  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => TextStyle(fontSize: 17);
  //===============================================//

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          //funcion ya establecida
          //print(query); //el query esta a la escucha de lo que se escribe en el input
          query = "";
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //return Text("buildLeading");
    return IconButton(
      onPressed: () {
        //funcionalidad ya establecidas para salir dde la seccion
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<TaskModel> results = tasks
        .where(
          (element) => element.title.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return ItemTaskWidget(
            taskModel: results[index],
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return Text("buildSuggestions");

    //cualquier cadena contiene la cadena vacía, cuando no hay nada escrito results=name
    List<TaskModel> results = tasks
        .where(
          (element) => element.title.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return ItemTaskWidget(
            taskModel: results[index],
          );
        },
      ),
    );
  }
}
