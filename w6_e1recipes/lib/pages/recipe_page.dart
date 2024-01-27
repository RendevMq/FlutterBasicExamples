import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  String urlImage;
  String title;
  String description;
  RecipePage({
    required this.urlImage,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff29304B),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 23, 36),
          title: Text(
            title.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton( //personalizamos nuestro icono, para cambiar al que esta por defecto
            icon: Icon(Icons.arrow_left_sharp , color: Colors.white, size: 40,),
            onPressed: () {
              Navigator.pop(context); //con esto le damos la funcionalidad
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    urlImage,
                    // height: 200,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white60,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
