import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_reviews_cubit/movie_reviews_cubit.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';
import 'package:red_line/src/features/movie_details/presentation/movie_details.dart';

class FavouritsElement extends StatelessWidget {
  const FavouritsElement({
    super.key,
    required this.movie,
    required this.controller,
  });

  final PersistentTabController controller;
  final MovieDetailModel movie;

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.025, vertical: size.height * 0.006),
      child: GestureDetector(
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
        child: Card(
          elevation: 5,
          color: themeExtension?.secondaryOverlayElementBackgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * 0.02),
                child: Container(
                  width: size.width * 0.255,
                  height: size.height * 0.1775,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      theMovieDatabaseApiImageBaseURL + movie.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: scaler.scale(18),
                          fontWeight: FontWeight.bold,
                          color: themeExtension?.mainTextColor,
                        ),
                      ),
                      SizedBox(height: size.height * 0.006),
                      Text(
                        'Release Date: ${movie.releaseDate}',
                        style: TextStyle(
                          fontSize: scaler.scale(14),
                          color: themeExtension?.decentLabelColor,
                        ),
                      ),
                      SizedBox(height: size.height * 0.006),
                      Text(
                        movie.overview,
                        style: TextStyle(
                          fontSize: scaler.scale(14),
                          color: themeExtension?.mainTextColor,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: size.height * 0.006),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: themeExtension?.starIconColor,
                            size: scaler.scale(20),
                          ),
                          SizedBox(width: size.height * 0.0025),
                          Text(
                            '${movie.voteAverage.toStringAsFixed(1)} (${movie.voteCount} votes)',
                            style: TextStyle(
                              color: themeExtension?.mainTextColor,
                              fontSize: scaler.scale(14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
