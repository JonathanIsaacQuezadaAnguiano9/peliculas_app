import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////////////////
    // se envía el argumento, en caso de ser invalido envía 'película inexistente'
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ??
            'película_inexistente';
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
    return const SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      pinned: true,
      snap: false,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          'movie.title',
          style: TextStyle(color: Colors.amber),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 200,
            width: 100,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
            Text(
              'movie.title',
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
                  'movie.voteAverage',
                  style: textTheme.bodySmall,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Exercitation esse esse voluptate voluptate labore aliqua. Occaecat in esse eu irure consequat culpa in duis aute veniam. Qui et occaecat amet nulla proident sit. Do do incididunt quis ad pariatur tempor. Labore cupidatat ex occaecat officia duis culpa proident sit consectetur est laboris elit consectetur ut. Cupidatat magna magna Lorem irure reprehenderit consectetur reprehenderit ipsum proident quis cupidatat ex sunt Lorem.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
