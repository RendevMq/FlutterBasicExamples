import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:w11_e2firebase/model/partidos_model.dart';
import 'package:w11_e2firebase/widgets/partidos_item_widget.dart';

class PartidosPage extends StatelessWidget {
  // const PartidosPage({super.key});

  CollectionReference taskReference =
      FirebaseFirestore.instance.collection("partidosPoliticos");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Partidos Políticos"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: taskReference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasData) {
                List<PartidoModel> partidos = [];
                QuerySnapshot collection = snap.data;

                partidos = collection.docs.map((e) {
                  PartidoModel partidoModel =
                      PartidoModel.fromJson(e.data() as Map<String, dynamic>);
                  partidoModel.partido = e.id;
                  return partidoModel;
                }).toList();

                return ListView.builder(
                  itemCount: partidos.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PartidoItemWidget(partido: partidos[index]);
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
