import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:w11_e2firebase/model/partidos_model.dart';

class PartidoItemWidget extends StatelessWidget {
  // const PartidosItemWidget({super.key});

  PartidoModel partido;
  PartidoItemWidget({required this.partido});
  
  late final CollectionReference _partidoReference =
      FirebaseFirestore.instance.collection("partidosPoliticos");

  Future<void> AnadirVoto(String partido, int votos) async {
    await _partidoReference.doc(partido).update({
      "votantes": votos + 1,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 219, 238, 253),
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          print("awdw");
          AnadirVoto(partido.partido! , partido.votantes);
        },
        child: ListTile(
          leading: CircleAvatar(
            child: Image.network(partido.image),
          ),
          title: Text("${partido.partido} - ${partido.representante}"),
          subtitle: Text(
            partido.descripcion,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            "Votos: ${partido.votantes}",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
