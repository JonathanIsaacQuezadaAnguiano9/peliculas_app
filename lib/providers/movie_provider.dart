import 'package:peliculas_app/models/search_response.dart';

import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
//////////////////////////////////////////////////////////////////////////////////////////
//Configuración de endpoints
  final String _apiKey = 'f1b90dfbf88f536000e6aafe64522743';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> movieCast = {};
//////////////////////////////////////////////////////////////////////////////////////////

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

//////////////////////////////////////////////////////////////////////////////////////////
  //Se crea el endpoint indicado
  Future<String> _getJsonData(String endPoint) async {
    var url = Uri.https(_baseUrl, '/3/movie/$endPoint', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    return response.body;
  }
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//Se crea el endpoint de peliculas
  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); // le da la información del cambio de datos
  }
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//Se crea el endpoint de populares
  getPopularMovies() async {
    final jsonData = await _getJsonData('popular');
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    final jsonData = await _getJsonData('3/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query,
    });
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }
}
//////////////////////////////////////////////////////////////////////////////////////////


//https://api.themoviedb.org/3/movie/now_playing?api_key=f1b90dfbf88f536000e6aafe64522743
