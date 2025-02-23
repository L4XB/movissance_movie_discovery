import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/discover_more_button.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre/genre_chips_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/greeting_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie/movie_grid_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/search/searchfield_widget.dart';

class HomeScreenContent extends StatefulWidget {
  final PersistentTabController controller;

  const HomeScreenContent({super.key, required this.controller});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    final size = MediaQuery.of(context).size;
    return RefreshIndicator(
      color: themeExtension?.primaryColor,
      onRefresh: () async {
        context.read<HomeMovieCubit>().loadMovies(standartLoadingPage);
        context.read<HomeGenreCubit>().unselectAllGenres();
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBoxExtension.height(size.height * 0.0705),
                GreetingWidget(
                  controller: widget.controller,
                ),
                SizedBoxExtension.height(size.height * 0.0235),
                SearchFieldWidget(),
                SizedBoxExtension.height(size.height * 0.0235),
                Stack(children: [
                  MovieGridWidget(
                    controller: widget.controller,
                  ),
                  GenreChipsWidget(),
                ]),
                DiscoverMoreButton(
                  controller: widget.controller,
                ),
                SizedBoxExtension.height(size.height * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
