import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ///////////////////////////////////////////////////////////////////////////
    //!configuración de la pantalla
    return SizedBox(
        width: double.infinity, // ancho posible de la pantalla
        height: size.height / 2, //alto posible /2
        child: Swiper(
          itemCount: 10, //items que se encuentran en el carrusel
          layout: SwiperLayout.STACK, //stack de imágenes
          itemWidth: size.width * 0.6, //ancho de los items en el carrusel
          itemHeight: size.height * 0.5, //largo de los items en el carrusel
          itemBuilder: (_, int index) {
            ///////////////////////////////////////////////////////////////////////////
            ///
            ///////////////////////////////////////////////////////////////////
            //!Construcción del carrusel
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments:
                      'movie_name'), // Al presionar se mandan los argumentos del carrusel a la pantalla 'details'
              child: ClipRRect(
                //widget que nos permite hacer la animación del carrusel
                borderRadius: BorderRadius.circular(30),
                child: const FadeInImage(
                  placeholder:
                      AssetImage('assets/no-image.jpg'), //imagen de carga
                  image: NetworkImage(
                      'https://via.placeholder.com/300x400'), //imagen de la película
                  fit: BoxFit.cover, //redondeo del border radius
                ),
              ),
            );
            ///////////////////////////////////////////////////////////////////
          },
        ));
  }
}
