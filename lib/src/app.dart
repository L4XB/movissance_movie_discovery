import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/widgets/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/home/bloc/filter_cubit/filter_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  final PersistentTabController controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeGenreCubit>(
            create: (context) =>
                HomeGenreCubit()..loadGenres(standartLoadingPage)),
        BlocProvider<HomeMovieCubit>(
            create: (context) =>
                HomeMovieCubit()..loadMovies(standartLoadingPage)),
        BlocProvider<FilterCubit>(create: (context) => FilterCubit()),
        BlocProvider<MovieDetailsCubit>(
            create: (context) => MovieDetailsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PersistentBottomNavBar(
          controller: controller,
        ),
      ),
    );
  }
}
