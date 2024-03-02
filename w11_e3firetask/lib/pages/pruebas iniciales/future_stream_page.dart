import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FutureStreamPage extends StatelessWidget {
  // const HomePage({super.key});

  CollectionReference taskReference =
      FirebaseFirestore.instance.collection("tasks");

  Stream<int> counter() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }

  Future<int> getNumber() async {
    //No es valido varios retornos
    return 1000;
  }

  @override
  Widget build(BuildContext context) {
    //Escuchamos los eventos dentro del strem
    counter().listen((event) {
      print(event);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Firestore"),
      ),
      body: StreamBuilder(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 50),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Firebase Firestore"),
    //   ),
    //   body: FutureBuilder(
    //     future: getNumber(),
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       return Center(
    //         child: Text(
    //           snapshot.data.toString(),
    //           style: const TextStyle(fontSize: 50),
    //         ),
    //       );
    //     },
    //   ),
    // );