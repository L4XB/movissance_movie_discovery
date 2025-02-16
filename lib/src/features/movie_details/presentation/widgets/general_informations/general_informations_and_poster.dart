import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';

class GeneralInformationsAndPoster extends StatelessWidget {
  const GeneralInformationsAndPoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is MovieDetailsError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is MovieDetailsLoaded) {
          return Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(theMovieDatabaseApiImageBaseURL +
                        state.movie.backdropPath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          );
        }
        return Text("Unknown state");
      },
    );
  }
}
