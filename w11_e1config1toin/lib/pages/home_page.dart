import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference productsReference =
      FirebaseFirestore.instance.collection("products");
  @override
  Widget build(BuildContext context) {
    List<String> documentsIds = [
      "WEDyLhQG0z994ZPKFCN6",
      "hai97WlOoVkVPCuHAhPc"
    ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                productsReference.get().then((value) {
                  QuerySnapshot productCollection = value;
                  // print(productCollection.size);
                  //print(productCollection.docs);

                  List<QueryDocumentSnapshot> docs = productCollection.docs;
                  // print(docs[1].id);
                  //print(docs[1].data());

                  docs.forEach((element) {
                    print(element.data());
                    // print(element.id);
                  });
                });
              },
              child: Text("Traer DATA"),
            ),
            ElevatedButton(
              onPressed: () {
                productsReference.add({
                  'name': 'animal',
                  'color': 'azul',
                  'tipo': 'mamifero',
                  'bipedo': false
                });
              },
              child: Text("Insertar 1"),
            ),
            ElevatedButton(
              onPressed: () {
                productsReference.doc('bividis').set(
                  //conduslta un documento, si no existe lo crea y si existe lo chanca
                  {"tipo": "ropa", "color": "Blanco"},
                );
              },
              child: Text("Insertar 2"),
            ),
            ElevatedButton(
              onPressed: () {
                productsReference.doc('bividis').update(
                  //actualiza las prop y si no existe la prop la agrega
                  {"name": "bividi", "color": "crema"},
                );
              },
              child: Text("Actualizar"),
            ),
            ElevatedButton(
              onPressed: () {
                productsReference.doc('bividis').delete();
              },
              child: Text("Eliminacion"),
            ),
            ElevatedButton(
              onPressed: () async {
                // Obtener la instancia de FirebaseFirestore
                final FirebaseFirestore firestore = FirebaseFirestore.instance;

                // Ejecutar una transacción para realizar eliminaciones múltiples
                await firestore.runTransaction((transaction) async {
                  // Iterar sobre los IDs de los documentos a eliminar
                  for (String docId in documentsIds) {
                    // Obtener una referencia al documento específico en la colección "products"
                    final DocumentReference documentReference =
                        firestore.collection("products").doc(docId);

                    // Eliminar el documento dentro de la transacción
                    await transaction.delete(documentReference);
                  }
                });
              },
              child: Text("Eliminación Múltiple"),
            ),
            ElevatedButton(
              onPressed: () async {
                // Obtener una instantánea de la colección "products" filtrada por el campo "color" igual a "rojo"
                QuerySnapshot productsReference = await FirebaseFirestore
                    .instance
                    .collection("products")
                    .where("color", isEqualTo: "azul")
                    .get();

                // Obtener la lista de documentos de la instantánea
                List<QueryDocumentSnapshot> docs = productsReference.docs;

                // Iterar sobre cada documento y imprimir sus datos
                docs.forEach((element) {
                  print(element.data());
                });
              },
              child: Text("Traer DATA FILTRADA (COLOR)"),
            ),
            ElevatedButton(
              onPressed: () {
                productsReference
                    .where("color", isEqualTo: "rojo")
                    .where("price", isLessThan: 20)
                    .get()
                    .then((value) {
                  QuerySnapshot productCollection = value;
                  List<QueryDocumentSnapshot> docs = productCollection.docs;
                  docs.forEach((element) {
                    print(element.data());
                  });
                });
              },
              child: Text("Traer DATA FILTRADA (COLOR,PRECIO)"),
            ),
          ],
        ),
      ),
    );
  }
}
