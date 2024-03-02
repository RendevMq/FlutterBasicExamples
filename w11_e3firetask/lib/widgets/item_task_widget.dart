import 'package:flutter/material.dart';
import 'package:w11_e3firetask/general/colors.dart';
import 'package:w11_e3firetask/models/task_model.dart';
import 'package:w11_e3firetask/services/my_service_firestore.dart';
import 'package:w11_e3firetask/widgets/general_widget.dart';
import 'package:w11_e3firetask/widgets/item_category_widget.dart';

class ItemTaskWidget extends StatelessWidget {
  // const ItemTaskWidget({super.key});

  TaskModel taskModel;

  ItemTaskWidget({required this.taskModel});

  final MyServiceFirestore _myServiceFirestore =
      MyServiceFirestore(collection: "tasks");

  showFinishedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Finalizar Tarea",
                style: TextStyle(
                  color: kBrandPrimaryColor.withOpacity(0.87),
                  fontWeight: FontWeight.w600,
                ),
              ),
              divider6(),
              Text(
                "¿Deseas finalizar la tarea seleccionada?",
                style: TextStyle(
                  fontSize: 13,
                  color: kBrandPrimaryColor.withOpacity(0.87),
                  fontWeight: FontWeight.w400,
                ),
              ),
              divider20(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                        fontSize: 14,
                        color: kBrandPrimaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  divider10Width(),
                  ElevatedButton(
                    onPressed: () {
                      _myServiceFirestore.finishedTask(taskModel.id!);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Finalizar",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBrandPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(4, 4),
                blurRadius: 12)
          ]),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemCategoryWidget(text: taskModel.category),
            divider6(),
            Text(
              taskModel.title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrimaryColor.withOpacity(0.85),
                  decoration: taskModel.status
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            divider3(),
            Text(
              taskModel.description,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: kBrandPrimaryColor.withOpacity(0.75),
              ),
            ),
            divider10(),
            Text(
              taskModel.date,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: kBrandPrimaryColor.withOpacity(0.75),
              ),
            ),
          ],
        ),
        Positioned(
          top: -10,
          right: -12,
          child: PopupMenuButton(
            onSelected: (value) {
              //CTRL + CLICK
              if (value == 2) {
                showFinishedDialog(context);
              }
            },
            elevation: 2,
            color: Colors.white,
            icon: Icon(
              Icons.more_vert,
              color: kBrandPrimaryColor.withOpacity(0.85),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            itemBuilder: (BuildContext context) {
              //CTRL + CLICK
              return [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    "Editar",
                    style: TextStyle(
                      fontSize: 14,
                      color: kBrandPrimaryColor.withOpacity(00.85),
                    ),
                  ),
                ),
                if (taskModel.status)
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Finalizar",
                      style: TextStyle(
                        fontSize: 14,
                        color: kBrandPrimaryColor.withOpacity(0.85),
                      ),
                    ),
                  ),
              ];
            },
          ),
        ),
      ]),
    );
  }
}
