import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////////////////
    // se envía el argumento, en caso de ser invalido envía 'película inexistente'
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    print(movie.title);
    /////////////////////////////////////////////////////

    return Scaffold(
        body: CustomScrollView(
      ///El sliver es un widget con un comportamiento enfocado al scroll en el padding
      slivers: [
        _CustomAppBard(),
        //invocar sliverList con el Sliver child list Delegate para poder crear la lista de widgets
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(),
          _Overview(),
        ])),
      ],
    ));
  }
}

class _CustomAppBard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    print(movie.title);
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      pinned: true,
      snap: false,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsetsDirectional.all(5),
          child: Text(
            movie.title,
            style: TextStyle(color: Colors.amber),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/cat-space.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  String? detailsId;
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    final textTheme = Theme.of(context).textTheme;
    detailsId = 'details${movie.id}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(children: [
        Hero(
          tag: detailsId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
                placeholder: AssetImage('assets/cat-space.gif'),
                image: NetworkImage(movie.fullBackdropPath),
                height: 300,
                width: MediaQuery.of(context).size.width / 2.5),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              Text(
                movie.originalTitle,
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 25,
                    color: Color.fromARGB(165, 169, 218, 32),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    (movie.voteAverage / 2).toString(),
                    style: textTheme.bodySmall,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
