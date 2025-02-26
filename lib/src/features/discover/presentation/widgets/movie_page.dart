import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_reviews_cubit/movie_reviews_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/movie_details.dart';

class MoviePage extends StatelessWidget {
  final MovieModel movie;
  final PersistentTabController controller;

  const MoviePage({required this.movie, super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return GestureDetector(
      onTap: () {
        context.read<MovieDetailsCubit>().loadMovieDetail(movie.id);
        context.read<MovieProviderCubit>().getProvider(movie.id);
        context.read<MovieReviewsCubit>().getReviews(movie.id);
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: MovieDetails(
            controller: controller,
          ),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                theMovieDatabaseApiImageBaseURL + movie.posterPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                themeExtension?.discoverPageOverlayColorOne as Color,
                themeExtension?.discoverPageOverlayColorTwo as Color,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: scaler.scale(28),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: size.height * 0.012),
                Text(
                  'Release Date: ${movie.releaseDate}',
                  style: TextStyle(
                    fontSize: scaler.scale(16),
                    color: themeExtension?.decentLabelColor,
                  ),
                ),
                SizedBox(height: size.height * 0.012),
                Row(
                  children: [
                    Icon(Icons.star,
                        color: themeExtension?.starIconColor,
                        size: scaler.scale(20)),
                    SizedBox(width: size.height * 0.006),
                    Text(
                      '${movie.voteAverage.toStringAsFixed(1)} / 10.0',
                      style: TextStyle(
                        fontSize: scaler.scale(16),
                        color: themeExtension?.decentLabelColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.012),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.125),
                  child: Text(
                    movie.overview,
                    style: TextStyle(
                      fontSize: scaler.scale(16),
                      color: themeExtension?.decentLabelColor,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
