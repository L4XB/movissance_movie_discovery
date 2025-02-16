import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre/genre_chip.dart';

class GenreBottomSheet extends StatelessWidget {
  const GenreBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeGenreCubit, HomeGenreState>(
      builder: (context, state) {
        if (state is HomeGenreLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeGenreError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is HomeGenreLoaded || state is HomeGenreSelected) {
          final genres = state is HomeGenreLoaded
              ? state.genres
              : (state as HomeGenreSelected).genres;

          return Container(
            width: double.infinity,
            color: CupertinoColors.systemBackground,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Wrap(
                children: genres.map((genre) {
                  return GenreChip(
                    genreModel: genre,
                  );
                }).toList(),
              ),
            ),
          );
        }
        return Center(
          child: Text("Unknown State"),
        );
      },
    );
  }
}
