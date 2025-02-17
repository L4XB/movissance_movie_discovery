import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

class MovieRatingRow extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieRatingRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.star,
              color: CupertinoColors.systemYellow,
              size: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, top: 5, right: 1),
            child: Text(
              movie.voteAverage.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, right: 5),
            child: Text(
              "/10.0",
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              " ● ",
              style: TextStyle(
                fontSize: 5,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Text(
              "${movie.voteCount} votes",
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
