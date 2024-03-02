import 'package:flutter/material.dart';
import 'package:w11_e3firetask/general/colors.dart';
import 'package:w11_e3firetask/models/task_model.dart';
import 'package:w11_e3firetask/services/my_service_firestore.dart';
import 'package:w11_e3firetask/widgets/button_normal_widget.dart';
import 'package:w11_e3firetask/widgets/general_widget.dart';
import 'package:w11_e3firetask/widgets/textfield_normal_widget.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final formKey = GlobalKey<FormState>();
  //Instancimos un objeto del modelo que creamos ("MyServiceFirestore")y le indicamos que apunte a la coleccion "tasks"
  MyServiceFirestore taskService = MyServiceFirestore(collection: "tasks");

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String categorySelected = "Personal";

  showSelectedDate() async {
    //capturamos el valor seleccionado
    DateTime? datetime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),

      //Cambiando estilos del dadtepicker
      cancelText: "Cancelar",
      confirmText: "Aceptar",
      helpText: "Seleccionar Fecha",
      builder: (BuildContext context, Widget? widget) {
        return Theme(
          data: ThemeData.light().copyWith(
              //Se copia el tema y luego hacemos los cambios
              dialogBackgroundColor: Colors.white,
              dialogTheme: DialogTheme(
                  backgroundColor: kBrandSecondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
              colorScheme: ColorScheme.light(primary: kBrandPrimaryColor)),
          child: widget!,
        );
      },
    );
    if (datetime != null) {
      //Si no seleccionamos nada en el calendario y salimos retorna nulo
      _dateController.text = datetime.toString().substring(0, 10);
      setState(() {});
    }
  }

  registerTask() {
    if (formKey.currentState!.validate()) {
      //Luego de cser validado puede agregar una tarea
      //Construimos el modelo
      TaskModel taskModel = TaskModel(
        title: _titleController.text,
        category: categorySelected,
        date: _dateController.text,
        description: _descriptionController.text,
        status: true,
      );
      taskService.adddTask(taskModel).then((value) {
        if (value.isNotEmpty) {
          Navigator.pop(context);
          //insertamos el snackbar luego de que se registro
          showSnackBarSucces(context, "La tarea fue registrada con éxito");
        }
      }).catchError((e) {
        showSnackBarError(
          context, "Hubo un inconveniente, inténtalo nuevamente");
          Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              //por defecto el showModalBottomSheet ya tiene bordes redondeados y un color de fondo, ahora lo personalizamos
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Agregar Tarea",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            divider10(),
            TextFieldNormalWidget(
                hintText: "Título",
                icon: Icons.text_fields,
                controller: _titleController),
            divider10(),
            TextFieldNormalWidget(
              hintText: "Descripcion",
              icon: Icons.description,
              controller: _descriptionController,
            ),
            divider10(),
            Container(
                width: double.infinity,
                child: const Text(
                  "Categoría : ",
                  textAlign: TextAlign.start,
                )),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 0,
              children: [
                FilterChip(
                  selected: categorySelected == "Personal", //true o false
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  backgroundColor: kBrandSecondaryColor,
                  label: const Text("Personal"),

                  selectedColor: categoryColor[
                      categorySelected], //cambiar color al seleccionar
                  checkmarkColor: Colors.white, //cambiar el color del check
                  labelStyle: TextStyle(
                      color: categorySelected == "Personal"
                          ? Colors.white
                          : kBrandPrimaryColor), //cambiar color de texto
                  onSelected: (bool value) {
                    categorySelected = "Personal";
                    setState(() {});
                  },
                ),
                FilterChip(
                  selected: categorySelected == "Trabajo", //true o false
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  backgroundColor: kBrandSecondaryColor,
                  label: const Text("Trabajo"),
                  selectedColor: categoryColor[
                      categorySelected], //cambiar color al seleccionar
                  checkmarkColor: Colors.white, //cambiar el color del check
                  labelStyle: TextStyle(
                    color: categorySelected == "Trabajo"
                        ? Colors.white
                        : kBrandPrimaryColor,
                  ), //cambiar color de texto //cambiar color de texto
                  onSelected: (bool value) {
                    categorySelected = "Trabajo";
                    setState(() {});
                  },
                ),
                FilterChip(
                  selected: categorySelected == "Otro", //true o false
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  backgroundColor: kBrandSecondaryColor,

                  selectedColor: categoryColor[
                      categorySelected], //cambiar color al seleccionar
                  checkmarkColor: Colors.white, //cambiar el color del check
                  labelStyle: TextStyle(
                    color: categorySelected == "Otro"
                        ? Colors.white
                        : kBrandPrimaryColor,
                  ), //cambiar color de texto
                  label: const Text("Otro"),
                  onSelected: (bool value) {
                    categorySelected = "Otro";
                    setState(() {});
                  },
                ),
              ],
            ),
            divider10(),
            TextFieldNormalWidget(
              controller: _dateController,
              hintText: "Fecha",
              icon: Icons.date_range,
              onTapp: () {
                //print("Hola");
                showSelectedDate();
              },
            ),
            divider10(),
            ButtonNormalWidget(onPPressed: () {
              registerTask();
            }),
          ],
        ),
      ),
    );
  }
}
