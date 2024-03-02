import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:w11_e3firetask/general/colors.dart';
import 'package:w11_e3firetask/models/task_model.dart';
import 'package:w11_e3firetask/utils/task_search_delegate.dart';
import 'package:w11_e3firetask/widgets/button_normal_widget.dart';
import 'package:w11_e3firetask/widgets/general_widget.dart';
import 'package:w11_e3firetask/widgets/item_task_widget.dart';
import 'package:w11_e3firetask/widgets/task_form_widget.dart';
import 'package:w11_e3firetask/widgets/textfield_normal_widget.dart';

class HomePage extends StatelessWidget {
  // Definimos una referencia a la colección "tasks" en Firestore
  CollectionReference taskReference =
      FirebaseFirestore.instance.collection("tasks");

  showTaskForm(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor:
          Colors.transparent, //Le quitamos el color de fondo por defecto
      context: context,
      builder: (BuildContext context) {
        // return TaskFormWidget(); //Con esto el teclado taba al modal
        return Padding(
          padding: MediaQuery.of(context)
              .viewInsets, //Aprovecha el espacio disponible que el teclado le resta a la pantalla
          child: TaskFormWidget(),
        );
      },
    );
  }

  List<TaskModel> tasksGeneral = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandSecondaryColor,
      floatingActionButton: InkWell(
        //Como el gesture, solo que al darle click tiene efecto y sonido
        onTap: () {
          showTaskForm(context);
        },
        borderRadius: BorderRadius.circular(
            14), //con esto ya no sale el rectangulo por defecto, luego de presionar
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              color: kBrandPrimaryColor,
              borderRadius: BorderRadius.circular(14)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Nueva Tarea",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(4, 4))
                ],
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenido Ramón",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: kBrandPrimaryColor,
                      ),
                    ),
                    Text(
                      "Mis Tareas",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: kBrandPrimaryColor,
                      ),
                    ),
                    divider10(),
                    TextFieldNormalWidget(
                      controller: _searchController,
                      hintText: "Buscar tarea",
                      icon: Icons.search,
                      onTapp: () async {
                        await showSearch(
                          //es un future
                          context: context,
                          delegate: TaskSearchDelegate(tasks: tasksGeneral),
                        );
                      },
                    ),
                    divider3(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  Todas mis tareas",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kBrandPrimaryColor,
                      ),
                    ),
                    divider6(),
                    StreamBuilder(
                      stream: taskReference.snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        if (snap.hasData) {
                          List<TaskModel> tasks = [];
                          QuerySnapshot collection = snap.data;

                          // collection.docs.forEach((element) {
                          //   Map<String, dynamic> myMap =
                          //       element.data() as Map<String, dynamic>;
                          //   tasks.add(TaskModel.fromJson(myMap));
                          // });

                          // tasks = collection.docs
                          //     .map((e) => TaskModel.fromJson(
                          //         e.data() as Map<String, dynamic>))
                          //     .toList();

                          //requerimos que el e.id tambien sea alamacenado en nuestro modelo
                          //porque para editar alguna tarea necesitamos referencia el id y de momento no teniamos acceso, ya que no se encontraba en los campos y en nuestra lista solo teniamos los taskmodel sin el id para cada uno, por esa razon se añadio en el modelo taskmodel el campo id de forma no obligatoria. el factory tmb se modifico..
                          tasks = collection.docs.map((e) {
                            TaskModel taskmodel = TaskModel.fromJson(
                                e.data() as Map<String, dynamic>);
                            taskmodel.id = e.id;
                            return taskmodel;
                          }).toList();

                          tasksGeneral.clear(); //limpiamos al taskgeneral a enviar
                          tasksGeneral = tasks; //asignamos la lista de tasksmodels

                          return ListView.builder(
                            itemCount: tasks.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ItemTaskWidget(
                                taskModel: tasks[index],
                              );
                            },
                          );
                        }

                        return loadingWidget();
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
