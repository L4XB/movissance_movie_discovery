import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';

class MovieGridItem extends StatelessWidget {
  final MovieModel movie;
  const MovieGridItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
              height: 180,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
              child: AutoSizeText(
                movie.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
                wrapWords: false,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.star,
                    color: const Color.fromARGB(255, 228, 214, 90), size: 20),
                SizedBox(width: 2),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
