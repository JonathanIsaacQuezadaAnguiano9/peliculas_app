import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

import '../models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  const MovieSlider({super.key, required this.movies, this.title});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * .5;
    return Container(
      width: double.infinity,
      height: size.height,
      color: Color.fromARGB(255, 0, 0, 4),
      child: SizedBox(
        height: size.height / 2,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 20), //margen del texto
                  child: Text(
                    title!,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, int index) => _MoviePoster(
                          movie: movies[index],
                        )),
              ),
            ]),
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster({required this.movie});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'details', arguments: movie.toString()),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.amber,
        ),
        width: 130,

        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        ////////////////////////////////////////////////////////////////////////////////////////////////
        ///
        ///Contenido de los posters
        child: Column(children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.vertical(
                  top: Radius.circular(25)),
              child: FadeInImage(
                  //Lugar donde se encuentran las imágenes
                  placeholder: const AssetImage(
                      'assets/cat-space.gif'), //imagen de carga
                  image: NetworkImage(
                      movie.fullPoosterimg), //imagen que se va a mostrar
                  width: 130, //anchura
                  height: 250, //altura

                  fit: BoxFit.cover),
            ),
          ),

          Text(
            movie.title,
            maxLines: 3,
            style: const TextStyle(
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ) //Texto de describe la película
        ]),
        ////////////////////////////////////////////////////////////////////////////////////////////////
      ),
    );
  }
}
