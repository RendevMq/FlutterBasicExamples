import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w6_e1recipes/model/recipe_model.dart';
import 'package:w6_e1recipes/widgets/recipe_item.dart';
import 'package:w6_e1recipes/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  String title = "";

  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  TextEditingController urlImageControler = TextEditingController();

  List<Recipe> recipesModelList = [
    Recipe(
      urlImage:
          "https://www.oliveandmango.com/images/uploads/2022_07_18_lomo_saltado_1.jpg",
      title: "Lomo Saltado",
      description:
          "El lomo saltado es un plato infaltable en nuestras mesas y se caracteriza por la sencillez de su preparación que requiere –además de los ingredientes básicos como la carne, la papa y el arroz– de una sartén (o wok) caliente para dar vida a unos de los sabores más representativos de la gastronomía nacional.El lomo saltado es un plato infaltable en nuestras mesas y se caracteriza por la sencillez de su preparación que requiere –además de los ingredientes básicos como la carne, la papa y el arroz– de una sartén (o wok) caliente para dar vida a unos de los sabores más representativos de la gastronomía nacional.\n\nEl lomo saltado es un plato infaltable en nuestras mesas y se caracteriza por la sencillez de su preparación que requiere –además de los ingredientes básicos como la carne, la papa y el arroz– de una sartén (o wok) caliente para dar vida a unos de los sabores más representativos de la gastronomía nacional.El lomo saltado es un plato infaltable en nuestras mesas y se caracteriza por la sencillez de su preparación que requiere –además de los ingredientes básicos como la carne, ",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2B2D4A),
        //Remover este widget (SingleChildScrollView) si estamos probando el ejemplo de 
        // UN SOLOO EXPANDED , Si probamoos el ejemploo de 2 Container.. conservarlo
        body: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "My recipes",
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //estados textfiel: Enabled Focus, error disable
            formulario_input(
                titleControler, "Sugerencia de nombre de titulo", "type"),
            formulario_input(descriptionControler,
                "Sugerencia de la descripcion", "align-justify"),
            formulario_input(urlImageControler,
                "Sugerencia de la url de la imagen", "image"),
        
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // recipesModelList auxRecipe = {
                  //   "urlImage": urlImageControler.text,
                  //   "title": titleControler.text,
                  //   "description": descriptionControler.text,
                  // };
                  Recipe auxRecipe = Recipe(
                      urlImage: urlImageControler.text,
                      title: titleControler.text,
                      description: descriptionControler.text);
                  recipesModelList.add(auxRecipe);
                  setState(() {});
                  titleControler.clear();
                  descriptionControler.clear();
                  urlImageControler.clear();
                },
                child: Text(
                  "Agregar",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0B59D7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            Divider(height: 40, thickness: 3, color: Color(0xff626B92)),
            Text(
              "Listado General",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // ...recipes
            //     .map((e) => RecipeItem(
            //           urlImage: e["urlImage"],
            //           title: e["title"],
            //           description: e["description"],
            //         ))
            //     .toList()
            // ...List.generate(recipesModelList.length, (index) {
            //   final dish = recipesModelList[index];
            //   return RecipeItem(
            //     urlImage: dish.urlImage,
            //     title: dish.title,
            //     description: dish.description,
            //   );
            // })
        
            //=====================UN SOLOO EXPANDED==================//
            Expanded(
              child: ListView.builder(
                // shrinkWrap: ,
                // scrollDirection: Axis.horizontal,
                itemCount: recipesModelList.length,
                itemBuilder: (context, index) {
                  //loogica
                  return 
                  RecipeItem(
                      urlImage: recipesModelList[index].urlImage,
                      description: recipesModelList[index].description,
                      title: recipesModelList[index].title,
                  );
      
                },
              ),
            ),
        
            //===============2 SCROOLLS CON LOS 2 CONTEINERS SINN COOONTAINER=============== //
            //====OJO, ME DEB FIJAR SI ARRIBA ESTA ENVUELTOO CON UN  SingleChildScrollView ==//
            
            // Container(
            //     // width: fit,
            //     margin: EdgeInsets.symmetric(vertical: 20),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.blue)
            //     ),
            //     height: 400,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       // scrollDirection: Axis.horizontal,
            //       itemCount: recipesModelList.length,
            //       itemBuilder: (context, index) {
            //         //loogica
            //         return RecipeItem(
            //           urlImage: recipesModelList[index].urlImage,
            //           description: recipesModelList[index].description,
            //           title: recipesModelList[index].title,
            //         );
          
            //         // Container(
            //         //   height: 100,
            //         //   width: 120,
            //         //   margin: EdgeInsets.all(10),
            //         //   color:Colors.red
            //         // );
            //       },
            //     ),
            //   ),
        
            //   Container(
            //     // width: fit,
            //     margin: EdgeInsets.symmetric(vertical: 20),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.blue)
            //     ),
            //     height: 400,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       // scrollDirection: Axis.horizontal,
            //       itemCount: recipesModelList.length,
            //       itemBuilder: (context, index) {
            //         //loogica
            //         return RecipeItem(
            //           urlImage: recipesModelList[index].urlImage,
            //           description: recipesModelList[index].description,
            //           title: recipesModelList[index].title,
            //         );
            //       },
            //     ),
            //   ),
          ]),
        ),
      ),
    );
  }
}
