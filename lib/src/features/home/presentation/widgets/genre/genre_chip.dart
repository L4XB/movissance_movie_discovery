import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
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
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return BlocBuilder<HomeGenreCubit, HomeGenreState>(
      builder: (context, state) {
        final selectedGenre = state is HomeGenreSelected ? state.genre : null;
        final isSelected = selectedGenre?.id == genreModel.id;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.013),
          child: GestureDetector(
            onTap: () {
              context.read<HomeGenreCubit>().selectGenre(genreModel);
              context
                  .read<HomeMovieCubit>()
                  .loadMoviesByGenre(1, genreId: genreModel.id);
            },
            child: Chip(
              label: Text(
                genreModel.name,
                style: TextStyle(
                    color: isSelected
                        ? themeExtension?.contrastTextColor
                        : themeExtension?.mainTextColor),
              ),
              backgroundColor: isSelected
                  ? themeExtension?.secondaryColor
                  : themeExtension?.contrastTextColor,
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
