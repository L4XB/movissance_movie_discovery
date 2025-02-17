import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/error_message.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/loading_indicator.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/movie_general_informations_content.dart';

class GeneralInformationsAndPoster extends StatelessWidget {
  const GeneralInformationsAndPoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return const LoadingIndicator();
        }
        if (state is MovieDetailsError) {
          return ErrorMessage(message: state.message);
        }
        if (state is MovieDetailsLoaded) {
          return MovieGeneralInformationsContent(movie: state.movie);
        }
        return const Text("Unknown state");
      },
    );
  }
}
