import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie/movie_grid_item.dart';

class MovieGridWidget extends StatelessWidget {
  final PersistentTabController controller;
  const MovieGridWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.0475),
      child: BlocBuilder<HomeMovieCubit, HomeMovieState>(
        builder: (context, state) {
          if (state is HomeMovieLoadingState) {
            return Padding(
              padding: EdgeInsets.only(top: size.height * 0.35),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is HomeMovieErrorState) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.35),
                child: Text(state.message),
              ),
            );
          }
          if (state is HomeMovieLoadedState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.048),
              child: GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return MovieGridItem(movie: movie, controller: controller);
                },
              ),
            );
          }
          return Text("Unknown state");
        },
      ),
    );
  }
}
