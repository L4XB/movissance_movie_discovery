import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre_chip.dart';

class GenreChipsWidget extends StatelessWidget {
  const GenreChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Popular Genres",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 53, 65, 93))),
              Text("View All",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(169, 0, 0, 0))),
            ],
          ),
        ),
        SizedBox(height: 10),
        BlocBuilder<HomeGenreCubit, HomeGenreState>(
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

              final firstTenGenres = genres.take(10).toList();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
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
