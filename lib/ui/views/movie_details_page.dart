import 'package:flutter/material.dart';
import 'package:movie_app/data/entity/movies.dart';

// ignore: must_be_immutable
class MovieDetailsPage extends StatefulWidget {
  Movies movie;

  MovieDetailsPage({super.key, required this.movie});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("img/${widget.movie.photo}"),
            Text(
              "₺${widget.movie.price}",
              style: const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
