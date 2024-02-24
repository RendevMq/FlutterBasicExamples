import 'package:flutter/material.dart';
import 'package:w9_e2taskdb/Models/task_model.dart';
import 'package:w9_e2taskdb/db/db_admin.dart';
import 'package:w9_e2taskdb/widgets/my_form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

showDialogForm(String textAction, {int? id}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return id != null
          ? MyFormWidget(action: textAction, idRegister: id)
          : MyFormWidget(action: textAction);
    },
  ).then((value) {
    print("El formulario fue cerrado");
    setState(() {});
  });
}

  deleteTask(int taskId) {
    DBAdmin.db.deleteTask(taskId).then(
      (value) {
        if (value > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.indigo,
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Tarea eliminadad"),
                ],
              ),
            ),
          );
        }
        // setState(() {
          
        // });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DBAdmin.db.getTask();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogForm("agregar");
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: FutureBuilder(
        future: DBAdmin.db.getTask(),
        builder: (BuildContext contex, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<TaskModel> mytask = snap.data; //variable para la Lista
            return ListView.builder(
              //mapeamos los datos en un ListTile con la variable mytask
              itemCount: mytask.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(), //Necesitamos ponerle un valor unico
                  // key: Key(index.toString()), //otra opcion
                  confirmDismiss: (DismissDirection direction) async {
                    //acepta un funcion con un aprametro y devuelve un future que retorna un bool, por eso le ponemos async
                    print("$direction ...Del confirmDismiss");
                    return true; //Si en caso retorna un false.. no permitira quitar el elemento
                  },
                  direction: DismissDirection
                      .startToEnd, //es un enum y tengo varias opciones para deslizar, en varias direcciones
                  background: Container(
                    color: Colors.redAccent,
                  ), //aparece cuando la direccion es de StartToEnd
                  secondaryBackground: const Text(
                      "Hola2"), //aparece cuando la direccion es de endToStart
                  onDismissed: (DismissDirection direction) {
                    print("$direction ...Del onDismissed (Elemento Eliminado)");
                    deleteTask(mytask[index].id!);
                    // mytask.removeAt(index);
                  },
                  child: ListTile(
                    title: Text(mytask[index].title),
                    subtitle: Text(mytask[index].description),
                    // trailing: Text(mytask[index].id.toString()),
                    trailing:     IconButton(
                      onPressed: () {
                        showDialogForm("modificar",id: mytask[index].id);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    // trailing: Row(
                    //   children: [
                    //     Text(mytask[index].id.toString()),
                    //     SizedBox(width: 6,),
                    //     Text(""),
                    //     SizedBox(width: 6,),                
                    //   ],
                    // )
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


/* Elementos de practica en el Body */
// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 DBAdmin.db.checkDatabase();
//                 // DBAdmin.db.getRawTask();
//                 DBAdmin.db.getTask();
//                 // DBAdmin.db.initDatabase();
//               },
//               child: Text("Mostrar Data"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // DBAdmin.db.insertRawTask();
//                 DBAdmin.db.insertTask();

//               },
//               child: Text("Insertar Tarea"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // DBAdmin.db.insertRawTask();
//                 DBAdmin.db.checkDatabase();
//                 // DBAdmin.db.updateRawTask();
//                 DBAdmin.db.updateTask();

//               },
//               child: Text("Actualizar Tarea"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 DBAdmin.db.checkDatabase();
//                 // DBAdmin.db.deleteRawTask();
//                 DBAdmin.db.deleteTask();


//               },
//               child: Text("Eliminar Tarea"),
//             ),
//           ],
//         ),
//       ),
