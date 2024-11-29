import 'package:flutter/material.dart';
import 'package:movie_app/data/entity/movies.dart';
import 'package:movie_app/ui/views/movie_details_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<Movies>> loadMovies() async {
    var movieList = <Movies>[];
    var m1 = Movies(id: 1, name: "Django", photo: "django.png", price: 24);
    var m2 = Movies(
        id: 2, name: "Interstellar", photo: "interstellar.png", price: 32);
    var m3 =
        Movies(id: 3, name: "Inception", photo: "inception.png", price: 16);
    var m4 = Movies(
        id: 4,
        name: "The Hateful Eight",
        photo: "thehatefuleight.png",
        price: 28);
    var m5 =
        Movies(id: 5, name: "The Pianist", photo: "thepianist.png", price: 18);
    var m6 =
        Movies(id: 6, name: "Anadoluda", photo: "anadoluda.png", price: 10);
    movieList.addAll([m1, m2, m3, m4, m5, m6]);
    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
      ),
      body: FutureBuilder<List<Movies>>(
        future: loadMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var moviesList = snapshot.data;
            return GridView.builder(
              itemCount: moviesList?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.8),
              itemBuilder: (context, index) {
                var movie = moviesList![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(
                            movie: movie,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("img/${movie.photo}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "₺${movie.price}",
                                style: const TextStyle(fontSize: 24),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    print("${movie.name} added");
                                  },
                                  child: const Text("Buy"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text("no data");
          }
        },
      ),
    );
  }
}
