//Clase que nos ayudadd a comunicaarnoos con Firestore para hacer la coleccion
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:w11_e3firetask/models/task_model.dart';

class MyServiceFirestore {
  String collection;
  MyServiceFirestore({required this.collection});

  //CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection); //Como coleccion tiene un valor nulo ahora, manda error, entonces le decimos que luego se va a inicializar con un late y final indicandole que no cambiare luego de crearlo
  late final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(
          collection); //Apuntara a la coleccion que mandemos como argumento , aunque en este caso solo tenemos al task, pero de esta forma si necesitamos que apunte a otro, solo lo mandadmos como arg

  //add
  Future<String> adddTask(TaskModel model) async {
    DocumentReference documentReference = await _collectionReference.add(
        //tenemos que eenviar a firebase un Mapa.. entonces requerimos de la funcion
        model.toJson());
    String id = documentReference
        .id; //cuando inserta la colleccion, el future me regresa un DocumentReference ppor el que podemos accedder a su id
    return id;

    ///print(documentReference.id)
  }

  //Update status
  Future <void>finishedTask(String taskId) async{
    await _collectionReference.doc(taskId).update({
      "status" : false,
    });
  }
}
