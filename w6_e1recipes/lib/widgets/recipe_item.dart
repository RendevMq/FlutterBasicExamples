import 'package:flutter/material.dart';
import 'package:w6_e1recipes/pages/recipe_page.dart';

class RecipeItem extends StatelessWidget {
  // const RecipeItem({super.key});

  String urlImage;
  String title;
  String description;
  RecipeItem({
    required this.urlImage,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        Navigator.push(  //nos sirve para navegar entre pantallas
          context,
          MaterialPageRoute( //la ruta.. siempre va "MaterialPageRoute"
            builder: (context) => RecipePage( //En el builder me dirijo a mi pantalla de destino
              urlImage: urlImage,
              description: description,
              title: title,
            ),
          ),
        );
      },     
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(5, 5),
                blurRadius: 8),
          ],
          borderRadius: BorderRadius.circular(16),
          color: Color(0xff626B92).withOpacity(0.3),
        ),
        width: double.infinity,
        // width: 500,
        child: Column(
          children: [
            ClipRRect(
              //proporciona una forma a su hijo
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                urlImage,
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
