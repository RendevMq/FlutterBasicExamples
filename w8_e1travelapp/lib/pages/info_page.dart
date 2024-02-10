import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  String imagen;

  // Añadir el llamado al constructor de la clase base
  InfoPage({required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagen),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(

              ),
            ),
          ),
        ],
      ),
    );
  }
}
