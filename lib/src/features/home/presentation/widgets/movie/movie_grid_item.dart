import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_reviews_cubit/movie_reviews_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/movie_details.dart';

class MovieGridItem extends StatelessWidget {
  final MovieModel movie;
  final PersistentTabController controller;
  const MovieGridItem(
      {super.key, required this.movie, required this.controller});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
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
      child: Card(
        color: themeExtension?.cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: movie.posterPath != ""
                  ? Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      height: size.height * 0.212,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      "assets/images/no_image_placeholder.png",
                      height: size.height * 0.212,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.009,
                left: size.width * 0.025,
                bottom: size.height * 0.0045,
              ),
              child: AutoSizeText(
                movie.title,
                style: TextStyle(
                  color: themeExtension?.mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
                wrapWords: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.022),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: themeExtension?.starIconColor,
                    size: scaler.scale(20),
                  ),
                  SizedBox(width: size.width * 0.007),
                  Text(
                    movie.voteAverage.toStringAsFixed(1),
                    style: TextStyle(
                        fontSize: scaler.scale(14),
                        fontWeight: FontWeight.bold,
                        color: themeExtension?.mainTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
