import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movie_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context,
        listen: true); //verifica si tiene dependencias y re dibuja

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 12,
        actions: [
          IconButton(
              onPressed: () =>
                  {Provider.of<MoviesProvider>(context, listen: false)},
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Tarjetas principales
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ),
            //Slider de peliculas
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
