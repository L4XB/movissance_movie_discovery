import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/discover/cubit/swiper_content_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_cubit/favourites_cubit.dart';

class SwiperFavouritFoatingActionButton extends StatelessWidget {
  const SwiperFavouritFoatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwiperContentCubit, SwiperContentState>(
      builder: (context, state) {
        if (state is SwiperContentLoaded) {
          final currentPage = state.index;
          final currentMovie = state.movies[currentPage];
          return BlocBuilder<FavouritesCubit, List<int>>(
            builder: (context, favouritesState) {
              final isFavourite = favouritesState.contains(currentMovie.id);
              return FloatingActionButton(
                onPressed: () {
                  if (isFavourite) {
                    context
                        .read<FavouritesCubit>()
                        .removeFavourite(currentMovie.id);
                  } else {
                    context
                        .read<FavouritesCubit>()
                        .addFavourite(currentMovie.id);
                  }
                },
                backgroundColor: CupertinoColors.systemGrey5,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Icon(
                    isFavourite ? Icons.bookmark : Icons.bookmark_outline,
                    color: Colors.yellow,
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
          child: const Icon(
            Icons.bookmark_outline,
            color: Colors.yellow,
            size: 35,
          ),
        );
      },
    );
  }
}
