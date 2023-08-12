import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String _apiKey = 'f1b90dfbf88f536000e6aafe64522743';
String _baseUrl = 'api.themoviedb.org';
String _language = 'es-ES';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('MoviesProvider Start');
    this.getNowMovies();
  }

  getNowMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });

    final response = await http.get(url);
    Map<String, dynamic> decodeData = json.decode(response.body);
    print(decodeData['results']);
  }
}

//https://api.themoviedb.org/3/movie/now_playing?api_key=f1b90dfbf88f536000e6aafe64522743