import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/home/presentation/widgets/discover_more_button.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre/genre_chips_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/greeting_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie/movie_grid_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/search/searchfield_widget.dart';

class HomeScreenContent extends StatelessWidget {
  final PersistentTabController controller;
  const HomeScreenContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBoxExtension.height(60),
              GreetingWidget(
                controller: controller,
              ),
              SizedBoxExtension.height(20),
              SearchFieldWidget(),
              SizedBoxExtension.height(20),
              Stack(children: [
                MovieGridWidget(),
                GenreChipsWidget(),
              ]),
              DiscoverMoreButton(
                controller: controller,
              ),
              SizedBoxExtension.height(25),
            ],
          ),
        ),
      ],
    );
  }
}
