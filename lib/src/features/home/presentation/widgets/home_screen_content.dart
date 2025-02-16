import 'package:flutter/material.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre/genre_chips_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/greeting_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie/movie_grid_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/search/searchfield_widget.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBoxExtension.height(60),
              GreetingWidget(),
              SizedBoxExtension.height(20),
              SearchFieldWidget(),
              SizedBoxExtension.height(20),
              Stack(children: [
                MovieGridWidget(),
                GenreChipsWidget(),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
