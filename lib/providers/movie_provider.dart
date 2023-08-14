import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/get_movies_responses.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'f1b90dfbf88f536000e6aafe64522743';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('MoviesProvider Start');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); // le da la información del cambio de datos
  }
}

//https://api.themoviedb.org/3/movie/now_playing?api_key=f1b90dfbf88f536000e6aafe64522743
