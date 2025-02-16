import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/movie_details/bloc/favourites_cubit/favourites_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details_content.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsContent(),
      floatingActionButton: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
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
                  backgroundColor: CupertinoColors.systemGrey5,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      isFavourite ? Icons.bookmark : Icons.bookmark_outline,
                      color: CupertinoColors.systemYellow,
                      size: 35,
                      key: ValueKey<bool>(isFavourite),
                    ),
                  ),
                );
              },
            );
          }
          return FloatingActionButton(
            onPressed: () {},
            backgroundColor: CupertinoColors.systemGrey5,
            child: Icon(
              Icons.bookmark_outline,
              color: CupertinoColors.systemYellow,
              size: 35,
            ),
          );
        },
      ),
    );
  }
}
