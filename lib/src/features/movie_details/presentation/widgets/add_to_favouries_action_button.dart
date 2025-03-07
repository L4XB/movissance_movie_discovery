import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_cubit/favourites_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';

class AddToFavouriesActionButton extends StatelessWidget {
  const AddToFavouriesActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, movieDetailsState) {
        if (movieDetailsState is MovieDetailsLoaded) {
          final movie = movieDetailsState.movie;
          return BlocBuilder<FavouritesCubit, List<int>>(
            builder: (context, favouritesState) {
              final isFavourite = favouritesState.contains(movie.id);
              return FloatingActionButton(
                onPressed: () {
                  if (isFavourite) {
                    context.read<FavouritesCubit>().removeFavourite(movie.id);
                  } else {
                    context.read<FavouritesCubit>().addFavourite(movie.id);
                  }
                },
                backgroundColor: themeExtension?.overlayElementBackgroundColor,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Icon(
                    isFavourite ? Icons.bookmark : Icons.bookmark_outline,
                    color: themeExtension?.favoritesIconColor,
                    size: scaler.scale(35),
                    key: ValueKey<bool>(isFavourite),
                  ),
                ),
              );
            },
          );
        }
        return FloatingActionButton(
          onPressed: () {},
          backgroundColor: themeExtension?.overlayElementBackgroundColor,
          child: Icon(
            Icons.bookmark_outline,
            color: themeExtension?.favoritesIconColor,
            size: scaler.scale(35),
          ),
        );
      },
    );
  }
}
