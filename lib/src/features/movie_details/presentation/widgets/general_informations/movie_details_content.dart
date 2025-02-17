import 'package:flutter/cupertino.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_details_row.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_poster.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_rating_row.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_title.dart';

class MovieDetailsContent extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieDetailsContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MoviePoster(backdropPath: movie.backdropPath),
        MovieTitle(title: movie.title),
        MovieDetailsRow(movie: movie),
        MovieRatingRow(movie: movie),
      ],
    );
  }
}
