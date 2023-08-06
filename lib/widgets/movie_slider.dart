import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * .5;
    return Container(
      width: double.infinity,
      height: size.height,
      color: const Color.fromARGB(255, 46, 39, 126),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20), //margen del texto
              child: Text(
                'Populares',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_, int index) => const _MoviePoster()),
            ),
          ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'details', arguments: 'movie_name'),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        width: 130,
        height: 190,

        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        ////////////////////////////////////////////////////////////////////////////////////////////////
        ///
        ///Contenido de los posters
        child: Column(children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie_name'),
            child: const ClipRRect(
              borderRadius:
                  BorderRadiusDirectional.vertical(top: Radius.circular(25)),
              child: FadeInImage(
                  //Lugar donde se encuentran las imágenes
                  placeholder:
                      AssetImage('assets/no-image.jpg'), //imagen de carga
                  image: AssetImage(
                      'assets/loading.gif'), //imagen que se va a mostrar
                  width: 130, //anchura
                  height: 190, //altura

                  fit: BoxFit.cover),
            ),
          ),

          const Text(
            'Star wars \n La vengananza del metalero cuya galleta fue consumida por el imperio ',
            maxLines: 50,
            style: TextStyle(color: Color.fromARGB(171, 70, 18, 1)),
          ) //Texto de describe la película
        ]),
        ////////////////////////////////////////////////////////////////////////////////////////////////
      ),
    );
  }
}
