import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w10_e1movieapp/models/movie_detail_model.dart';
import 'dart:io';

import 'package:w10_e1movieapp/models/movie_model.dart';
import 'package:w10_e1movieapp/utils/constants.dart';

class ApiService {
  //Centralizamos nuestro metodo getMoovies
  //De momento lo que se hacia con esta funcion en el Home page era de forma directa, primero teniamos una lista vacia la cual se llenaba de los datos dentro de la funcion y luego la funcion de llamaba desde el init state. Ahora vamos a gestionar a la funcion de tal forma que cuando se le llame me devuelva algo

  Future<List<MovieModel>> getMoovies() async {
    List<MovieModel> movies = []; //Lista vacia
    String _url =
        "${pathProduccion}/discover/movie?include_video=false&language=en-US&page=1";
    Uri _uri = Uri.parse(_url);

    http.Response _response = await http.get(
      _uri,
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${apiKey}',
      },
    );
    if (_response.statusCode == 200) {
      Map<String, dynamic> moviesMap = json.decode(
          _response.body); //del psoteman vemos que la respuesta es un Mapa
      movies = moviesMap["results"]
          .map<MovieModel>((e) => MovieModel.fromJson(e))
          .toList();
    }
    return movies; //retornamos movies,
  }

  Future<MovieDetailMovie?> getMovie(int movieId) async {
    String _url = "${pathProduccion}/movie/$movieId?language=en-US";
    Uri _uri = Uri.parse(_url);

    http.Response _response = await http.get(
      _uri,
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${apiKey}',
      },
    );
    if (_response.statusCode == 200) {
      Map<String, dynamic> movieMap = json.decode(_response.body);
      MovieDetailMovie movieDetailMovie = MovieDetailMovie.fromJson(movieMap);
      return movieDetailMovie;
    }
    return null;
  }
}
