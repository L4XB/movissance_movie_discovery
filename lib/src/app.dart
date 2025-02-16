import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/widgets/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeGenreCubit>(
            create: (context) => HomeGenreCubit()..loadGenres(1)),
        BlocProvider<HomeMovieCubit>(
            create: (context) => HomeMovieCubit()..loadMovies(1)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PersistentBottomNavBar(),
      ),
    );
  }
}
