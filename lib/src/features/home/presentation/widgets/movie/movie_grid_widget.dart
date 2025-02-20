import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie/movie_grid_item.dart';

class MovieGridWidget extends StatelessWidget {
  const MovieGridWidget({super.key});

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
                  return MovieGridItem(movie: movie);
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
