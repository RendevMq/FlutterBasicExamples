import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; //PASO 1

class ButtonsPage extends StatelessWidget {
  // const HomePage({super.key});

  //Apuntamos a nuestra coleccion, pero tenemos que ser especificos con el nobmre ya que podemos tener varios, }
  //SI TUVIERAMOS OTRA COLECCION MAS y tambien queremos su informacion, deberiamos agregar otro objeto CollectionReference con su debido nombre
  CollectionReference taskReference =
      FirebaseFirestore.instance.collection("tasks"); //PASO 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Firestore"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //=====OBTENER INFORMACION , 1ER METODO=======//
                //se obtiene la informacion solo una vez
                //print(taskReference.id);
                //print(taskReference.get()); //Future<QuerySnapshot<Map<String, dynamic>>>
                taskReference.get().then((value) {
                  //print(value); //Instance of '_JsonQuerySnapshot'
                  QuerySnapshot collection = value;
                  //print(collection.size); //2
                  //print(collection.docs); //[Instance of '_JsonQueryDocumentSnapshot', Instance of '_JsonQueryDocumentSnapshot']

                  //List<QueryDocumentSnapshot> docs = collection.docs;
                  //print(docs.length); //2
                  //print(docs[0]); //Instance of '_JsonQueryDocumentSnapshot'
                  // QueryDocumentSnapshot doc1 = docs[0];
                  // QueryDocumentSnapshot doc2 = docs[1];
                  // print(doc1.id); //Lat1ugYZOFESY7Wo2VNb
                  // print(doc1.data()); //{description: Hay que comprar....}
                  // print(doc2.id); //LnS1RTPYrmVkMg2RX327
                  // print(doc2.data()); //{descripcion: Debemos de c...}

                  collection.docs.forEach((element) {
                    //print(element.data());
                    //element.data() NO ES UN MAPA
                    //{description: Hay que comprar el nuevo disco de microondas, title: Comprar nuevo disco}
                    //{descripcion: Debemos de comprar cosas para la semana, title: Comprar tottus}
                    //Obligamos a element.data() que se comporte como Mapa, ya que tiene la estructura
                    Map<String, dynamic> myMap =
                        element.data() as Map<String, dynamic>;
                    print(myMap["title"]);
                    // Comprar nuevo disco
                    // Comprar tottus
                  });
                });
              },
              child: Text("Obtener la data"),
            ),
            ElevatedButton(
              onPressed: () {
                //CTRL + CLICK,  el .add es un Future<DocumentReference<T>> add(T data);
                //el argumento es de tipo T , significa que puede ser cualuqier tipo de objt
                taskReference.add({
                  "title": "Ir de compras al super",
                  "description": "Debemos de comprar comida para todo el mes"
                }).then(
                  (DocumentReference value) {
                    print(
                        value); //DocumentReference<Map<String, dynamic>>(tasks/praNXOHr6kNE1FMt8Akj)
                    print(value.id); //praNXOHr6kNE1FMt8Akj
                  },
                ).catchError((e) {
                  //Entra aca si esque ocurre un error en el proceso de registro, sabemos que todos los future tienen el catchError
                  print("Ocurrio un error en el registro");
                }).whenComplete(() {
                  //entra aca si o si, ya se que hubo o no un erroro
                  print("El registro terminó");
                });
              },
              child: Text("Agregar"),
            ),
            ElevatedButton(
              onPressed: () {
                //Apuntamos al documento y de damos al update
                //CTRL+CLICK , el .update Future<void> update(Map<Object, Object?> data)
                // es un future que no nos devuelve nada(void) , pero al ser un future igualemnte podemos usar el .then .catchError y .whenComplete
                taskReference.doc("Lat1ugYZOFESY7Wo2VNb").update({
                  "title": "Ir de paseo",
                  "description": "Tenemos que salir muy temprano"
                }).catchError((e) {
                  print(e);
                }).whenComplete(() {
                  print("Future completado");
                });
              },
              child: Text("Actualizar documento"),
            ),
            ElevatedButton(
              onPressed: () {
                //Apuntamos al id del documento a eliminar
                //CTRL + CLICK , el .delete Future<void> delete();
                taskReference
                    .doc("praNXOHr6kNE1FMt8Akj")
                    .delete()
                    .catchError((e) {
                  print(e);
                }).whenComplete(() {
                  print("Future terminado , Eliminacion");
                });
              },
              child: Text("Eliminar documento"),
            ),
            ElevatedButton(
              onPressed: () {
                //Colocamos el ID que preferimos al doc
                //CTRL + CLICK , el .set    Future<void> set(T data, [SetOptions? options]);
                taskReference.doc("A00001").set({
                  "title": "Ir al concierto",
                  "description": "Este fin de semana debemos ir al concierto"
                }).catchError((e) {
                  print(e);
                }).whenComplete(() {
                  print("Future terminado , creacion");
                });
              },
              child: Text("Agregar documento perso.."),
            )
          ],
        ),
      ),
    );
  }
}
