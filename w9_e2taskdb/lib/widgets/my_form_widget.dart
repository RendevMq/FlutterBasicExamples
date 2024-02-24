import 'package:flutter/material.dart';
import 'package:w9_e2taskdb/Models/task_model.dart';
import 'package:w9_e2taskdb/db/db_admin.dart';

class MyFormWidget extends StatefulWidget {
  final String action;
  int? idRegister;

  MyFormWidget({required this.action, this.idRegister});

  @override
  State<MyFormWidget> createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formkey = GlobalKey<
      FormState>(); //Llave global para identificar de forma unica al formulario
  //va a gestionar el estado del formulario y me ayudara con las validaciones..

  bool isFinished = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.idRegister != null) {
      DBAdmin.db.getTaskbyID(widget.idRegister!).then((value) {
        _titleController.text = value!.title;
        _descriptionController.text = value.description;
        isFinished = value.status.toLowerCase() == 'true';
        setState(() {});
      });
    }
  }

  addTask() {
    if (_formkey.currentState!.validate()) {
      TaskModel taskModel = TaskModel(
        title: _titleController.text,
        description: _descriptionController.text,
        status: isFinished.toString(),
      );
      DBAdmin.db.insertTask(taskModel).then((value) {
        if (value > 0) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              duration: const Duration(milliseconds: 1400),
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Tarea registrada con exito")
                ],
              ),
            ),
          );
        }
      });
    }
  }

  updateTask() {
    if (_formkey.currentState!.validate()) {
      TaskModel taskModel = TaskModel(
        title: _titleController.text,
        description: _descriptionController.text,
        status: isFinished.toString(),
        id: widget.idRegister
      );
      DBAdmin.db.updateTask(taskModel).then((value) {
        if (value > 0) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              duration: const Duration(milliseconds: 1400),
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Tarea modificada con exito")
                ],
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.idRegister != null) print(widget.idRegister);
    return AlertDialog(
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // "${widget.action=="agregar" ? "Agregar": "Modificar"}Agregar tarea"
            Text(
              "${widget.action == 'agregar' ? 'Agregar tarea' : 'Modificar tarea'}",
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(
              height: 6,
            ),
            TextFormField(
              validator: (String? value) {
                //CTRL + click y vemos la estructura, que es una funcion que recibe un string que puede ser nulo y retorna un String..//typedef FormFieldValidator<T> = String? Function(T? value)...value es todo lo que se escribe ne el input
                if (value!.isEmpty) {
                  return "El campo es obligatorio";
                }
                return null;
              },
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Titulo",
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "El campo es obligatorio";
                }
                if (value.length < 6) {
                  return "Debe tener min 6 caracteres";
                }
                return null;
              },
              controller: _descriptionController,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: "Descripcion",
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const Text("Estado: "),
                const SizedBox(
                  width: 6,
                ),
                Checkbox(
                  value: isFinished,
                  onChanged: (value) {
                    isFinished = value!;
                    setState(() {});
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.action == "agregar" ? addTask() : updateTask();
                  },
                  child: const Text(
                    "Aceptar",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
