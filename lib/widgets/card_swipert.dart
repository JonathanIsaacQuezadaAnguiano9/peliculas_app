import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * .5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    ///////////////////////////////////////////////////////////////////////////
    //!configuración de la pantalla
    return Container(
      color: Color.fromARGB(255, 6, 5, 0),
      child: SizedBox(
          width: double.infinity, // ancho posible de la pantalla
          height: size.height * .7, //alto posible /2
          child: Swiper(
            itemCount: movies.length, //items que se encuentran en el carrusel
            layout: SwiperLayout.STACK, //stack de imágenes
            itemWidth: size.width * 0.8, //ancho de los items en el carrusel
            itemHeight: size.height * 0.6, //largo de los items en el carrusel
            itemBuilder: (_, int index) {
              ///////////////////////////////////////////////////////////////////////////
              ////
              ///////////////////////////////////////////////////////////////////

              final movie = movies[index];
              ////////////////////////////
              //!Construcción del carrusel
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details',
                    arguments:
                        'movie_name'), // Al presionar se mandan los argumentos del carrusel a la pantalla 'details'
                child: ClipRRect(
                  //widget que nos permite hacer la animación del carrusel
                  borderRadius: BorderRadius.circular(30),
                  child: FadeInImage(
                    placeholder: const AssetImage(
                        'assets/no-image.jpg'), //imagen de carga
                    image: NetworkImage(
                        movie.fullPoosterimg), //imagen de la película
                    fit: BoxFit.cover, //redondeo del border radius
                  ),
                ),
              );
              ///////////////////////////////////////////////////////////////////
            },
          )),
    );
  }
}
