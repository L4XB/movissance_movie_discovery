import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_reviews_cubit/movie_reviews_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/movie_details.dart';

class MoviePage extends StatelessWidget {
  final MovieModel movie;

  const MoviePage({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return GestureDetector(
      onTap: () {
        context.read<MovieDetailsCubit>().loadMovieDetail(movie.id);
        context.read<MovieProviderCubit>().getProvider(movie.id);
        context.read<MovieReviewsCubit>().getReviews(movie.id);
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: MovieDetails(),
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
                Colors.black.withAlpha(204),
                Colors.black.withAlpha(51),
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
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: size.height * 0.012),
                Row(
                  children: [
                    Icon(Icons.star,
                        color: Colors.yellow, size: scaler.scale(20)),
                    SizedBox(width: size.height * 0.006),
                    Text(
                      '${movie.voteAverage.toStringAsFixed(1)} / 10.0',
                      style: TextStyle(
                        fontSize: scaler.scale(16),
                        color: Colors.white70,
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
                      color: Colors.white70,
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
