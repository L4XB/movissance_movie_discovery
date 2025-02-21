import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

class MovieRatingRow extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieRatingRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.38),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.005),
            child: Icon(
              Icons.star,
              color: themeExtension?.starIconColor,
              size: scaler.scale(20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.0075,
                top: size.height * 0.005,
                right: size.width * 0.00375),
            child: Text(
              movie.voteAverage.toStringAsFixed(1),
              style: TextStyle(
                fontSize: scaler.scale(14),
                fontWeight: FontWeight.bold,
                color: themeExtension?.mainTextColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.005, right: size.width * 0.0125),
            child: Text(
              "/10.0",
              style: TextStyle(
                color: themeExtension?.decentLabelColor,
                fontSize: scaler.scale(14),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.005),
            child: Text(
              " ● ",
              style: TextStyle(
                fontSize: scaler.scale(5),
                color: themeExtension?.decentLabelColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.005, left: size.width * 0.0125),
            child: Text(
              "${movie.voteCount} votes",
              style: TextStyle(
                color: themeExtension?.mainTextColor,
                fontSize: scaler.scale(14),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
