import 'package:flutter/cupertino.dart';
import 'package:red_line/src/common/utils/string_formater.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

class MovieDetailsRow extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieDetailsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              movie.releaseDate.substring(0, 4),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          const Text(
            " ● ",
            style: TextStyle(
              fontSize: 5,
              color: CupertinoColors.systemGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              movie.genres.first.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          const Text(
            " ● ",
            style: TextStyle(
              fontSize: 5,
              color: CupertinoColors.systemGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              StringFormater.minutesToHours(movie.runtime),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
