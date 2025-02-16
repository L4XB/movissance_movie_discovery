import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({
    super.key,
    required this.genreModel,
  });

  final GenreModel genreModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeGenreCubit, HomeGenreState>(
      builder: (context, state) {
        final selectedGenre = state is HomeGenreSelected ? state.genre : null;
        final isSelected = selectedGenre?.id == genreModel.id;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              context.read<HomeGenreCubit>().selectGenre(genreModel);
              context
                  .read<HomeMovieCubit>()
                  .loadMoviesByGenre(genreModel.id, 1);
            },
            child: Chip(
              label: Text(
                genreModel.name,
                style:
                    TextStyle(color: isSelected ? Colors.white : Colors.black),
              ),
              backgroundColor:
                  isSelected ? CupertinoColors.activeBlue : Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        );
      },
    );
  }
}
