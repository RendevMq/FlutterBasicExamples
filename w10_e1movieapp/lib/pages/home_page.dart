import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:w10_e1movieapp/models/movie_model.dart';
import 'package:w10_e1movieapp/services/api_service.dart';
import 'package:w10_e1movieapp/ui/general/colors.dart';
import 'dart:io';

import 'package:w10_e1movieapp/ui/widgets/item_movie_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  
  List<MovieModel> movies = [];

  getData() {
    ApiService _apiServices = ApiService();
    _apiServices.getMoovies().then((value) {
      movies = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getMoovies();
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        //cubirmos la columna con un expanded por si los textos inscrementan su longitud y evitamos un desbordamiento
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Welcome Carlos",
                              style: TextStyle(color: Colors.white)),
                          Text("Discover",
                              style: TextStyle(
                                  height:
                                      1.25, //reducir el espacio del texto con otro elemento
                                  color: Colors.white,
                                  fontSize: 38,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 26.0,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    ),
                  ],
                ),
                //Seccion de caategorias

                //Seccion de listado de peliculas
                const SizedBox(
                  height: 20,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemMovieWidget(
                      movieModel: movies[index],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
