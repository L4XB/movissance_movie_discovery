import 'package:flutter/material.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre_chips_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/greeting_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie_grid_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/searchfield_widget.dart';

class HomeScreenContent extends StatelessWidget {
  final List<GenreModel> genres;
  final List<MovieModel> movies;
  const HomeScreenContent(
      {super.key, required this.genres, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              GreetingWidget(),
              SizedBoxExtension.height(20),
              SearchFieldWidget(),
              SizedBoxExtension.height(20),
              GenreChipsWidget(genres: genres),
              SizedBoxExtension.height(20),
              MovieGridWidget(movies: movies),
            ],
          ),
        ),
      ],
    );
  }
}
