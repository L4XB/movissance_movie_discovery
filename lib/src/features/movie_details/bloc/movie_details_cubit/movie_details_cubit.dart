import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());
}
