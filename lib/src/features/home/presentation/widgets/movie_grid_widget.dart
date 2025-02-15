import 'package:flutter/material.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie_grid_item.dart';

class MovieGridWidget extends StatelessWidget {
  final List<MovieModel> movies;
  const MovieGridWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Top Movies",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 53, 65, 93))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.7,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieGridItem(movie: movie);
            },
          ),
        ),
      ],
    );
  }
}
