import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie_grid_item.dart';

class MovieGridWidget extends StatelessWidget {
  const MovieGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Top Movies",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 53, 65, 93))),
            ],
          ),
        ),
        BlocBuilder<HomeMovieCubit, HomeMovieState>(
          builder: (context, state) {
            if (state is HomeMovieLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeMovieErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is HomeMovieLoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
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
      ],
    );
  }
}
