import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/utils/string_formater.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

class MovieDetailsRow extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieDetailsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
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
                color: themeExtension?.decentLabelColor,
              ),
            ),
          ),
          Text(
            " ● ",
            style: TextStyle(
              fontSize: scaler.scale(5),
              color: themeExtension?.decentLabelColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.012),
            child: Text(
              movie.genres.first.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: scaler.scale(14),
                color: themeExtension?.decentLabelColor,
              ),
            ),
          ),
          Text(
            " ● ",
            style: TextStyle(
              fontSize: scaler.scale(5),
              color: themeExtension?.decentLabelColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.012),
            child: Text(
              StringFormater.minutesToHours(movie.runtime),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: scaler.scale(14),
                color: themeExtension?.decentLabelColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
