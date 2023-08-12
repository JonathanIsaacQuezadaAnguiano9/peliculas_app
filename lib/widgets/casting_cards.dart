import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 220,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index) => _CastCard()),
    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 100,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: AssetImage('assets/no-image.jpg'),
              height: 150,
              width: 100,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'actor.name',
            style: TextStyle(color: Colors.amber),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
