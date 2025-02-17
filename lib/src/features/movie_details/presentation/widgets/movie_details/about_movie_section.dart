import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/error_message.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/loading_indicator.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_overview.dart';

class AboutMovieSection extends StatelessWidget {
  const AboutMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("About the Movie",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 53, 65, 93))),
            ),
          ],
        ),
        SizedBoxExtension.height(10),
        BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, movieDetailsState) {
          if (movieDetailsState is MovieDetailsLoading) {
            return LoadingIndicator();
          }
          if (movieDetailsState is MovieDetailsError) {
            return ErrorMessage(message: movieDetailsState.message);
          }
          if (movieDetailsState is MovieDetailsLoaded) {
            final status = movieDetailsState.movie.status;
            final overview = movieDetailsState.movie.overview;
            final tagline = movieDetailsState.movie.tagline;
            return MovieOverview(
                status: status, overview: overview, tagline: tagline);
          }
          return Text("Unknown state");
        })
      ],
    );
  }
}
