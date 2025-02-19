import 'package:flutter/cupertino.dart';
import 'package:red_line/src/common/utils/string_formater.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

class MovieDetailsRow extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieDetailsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.382),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.012),
            child: Text(
              movie.releaseDate.substring(0, 4),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: scaler.scale(14),
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          Text(
            " ● ",
            style: TextStyle(
              fontSize: scaler.scale(5),
              color: CupertinoColors.systemGrey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.012),
            child: Text(
              movie.genres.first.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: scaler.scale(14),
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          Text(
            " ● ",
            style: TextStyle(
              fontSize: scaler.scale(5),
              color: CupertinoColors.systemGrey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.012),
            child: Text(
              StringFormater.minutesToHours(movie.runtime),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: scaler.scale(14),
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
