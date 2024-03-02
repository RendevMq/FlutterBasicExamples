import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamListTile extends StatelessWidget {
  // Definimos una referencia a la colección "tasks" en Firestore
  CollectionReference taskReference =
      FirebaseFirestore.instance.collection("tasks");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Firestore"),
      ),
      body: StreamBuilder(
        stream: taskReference.snapshots(),  // CTRL + CLICK , el  .snapshots es un stream POR EL QUE FLUYE UN QuerySnapshot ...Stream<QuerySnapshot<T>> snapshots({bool includeMetadataChanges = false});
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data); // Devuelve "Instance of '_JsonQuerySnapshot'"
          
          // Verificamos si hay datos en el snapshot
          if (snapshot.hasData) {
            // Obtenemos la colección de documentos del snapshot
            QuerySnapshot collection = snapshot.data;    
            //print(collection.size);

            // Obtenemos la lista de documentos
            List<QueryDocumentSnapshot> docs = collection.docs;

            // Convertimos cada documento a un mapa
            List<Map<String, dynamic>> docsMap =
                docs.map((e) => e.data() as Map<String, dynamic>).toList();
            print(docsMap);

            // Construimos un ListView basado en los datos
            return ListView.builder(
              itemCount: docsMap.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(docsMap[index]["title"]),
                  subtitle: Text(docsMap[index]["description"]),
                );
              },
            );
          }

          // Si no hay datos, mostramos un indicador de carga
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
