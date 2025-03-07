import 'package:flutter/cupertino.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_details_row.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_poster.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_rating_row.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_title.dart';

class MovieGeneralInformationsContent extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieGeneralInformationsContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Widget ----------------- ///
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // movie poster
        MoviePoster(backdropPath: movie.backdropPath),

        // movie title
        MovieTitle(title: movie.title),

        // movie details row
        MovieDetailsRow(movie: movie),

        // movie rating row
        MovieRatingRow(movie: movie),
      ],
    );
  }
}
