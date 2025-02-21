import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_overview.dart';

class AboutMovieSection extends StatelessWidget {
  const AboutMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.076),
              child: Text("About the Movie",
                  style: TextStyle(
                      fontSize: scaler.scale(20),
                      fontWeight: FontWeight.bold,
                      color: themeExtension?.headLineTextColor)),
            ),
          ],
        ),
        SizedBoxExtension.height(size.height * 0.012),
        BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, movieDetailsState) {
          if (movieDetailsState is MovieDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (movieDetailsState is MovieDetailsError) {
            return Center(
              child: Text(movieDetailsState.message),
            );
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
