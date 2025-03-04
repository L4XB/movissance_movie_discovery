import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre/genre_bottom_sheet.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre/genre_chip.dart';

class GenreChipsWidget extends StatelessWidget {
  const GenreChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.0525),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Popular Genres",
                  style: TextStyle(
                      fontSize: scaler.scale(20),
                      fontWeight: FontWeight.bold,
                      color: themeExtension?.headLineTextColor)),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return GenreBottomSheet();
                    },
                  );
                },
                child: Text("View All",
                    style: TextStyle(
                        fontSize: scaler.scale(12),
                        fontWeight: FontWeight.bold,
                        color: themeExtension?.secondaryLabelColor)),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        BlocBuilder<HomeGenreCubit, HomeGenreState>(
          builder: (context, state) {
            if (state is HomeGenreLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: themeExtension?.primaryColor,
                ),
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

              final firstTenGenres = genres.take(8).toList();

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.0475),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: firstTenGenres.map((genre) {
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
        ),
      ],
    );
  }
}
