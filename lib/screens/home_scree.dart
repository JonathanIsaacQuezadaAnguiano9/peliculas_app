import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 12,
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            //Tarjetas principales
            CardSwiper(),
            //Slider de peliculas
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
