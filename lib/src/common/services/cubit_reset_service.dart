import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_filter_cubit/favourites_filter_cubit.dart';
import 'package:red_line/src/features/home/bloc/filter_cubit/filter_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/detials_selection_cubit/details_selection_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_reviews_cubit/movie_reviews_cubit.dart';

class CubitResetService {
  static void resetCubits(BuildContext context) {
    context.read<FilterCubit>().reset();
    context.read<MovieDetailsCubit>().reset();
    context.read<DetailsSelectionCubit>().reset();
    context.read<MovieProviderCubit>().reset();
    context.read<MovieReviewsCubit>().reset();
    context.read<FavouritesDataCubit>().reset();
    context.read<FavouritesFilterCubit>().reset();
  }
}
