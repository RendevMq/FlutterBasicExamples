import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //Solo van widgets de tipo sliver
        SliverAppBar(
          title: Text("Hola"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          expandedHeight: 200,
          // flexibleSpace: Container(
          //   color: Colors.black,
          // ),
          pinned: true,
          floating: true,
          snap: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            //CTRL + CLICK requiere un children obligatorio que es una lista de widgets
            [
              Container(
                width: 100,
                height: 300,
                color: Colors.redAccent,
              ),
              Container(
                width: 100,
                height: 300,
                color: Colors.blue,
              ),
              Container(
                width: 100,
                height: 300,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
