import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/home/data/api_movie_repository.dart';
import 'package:red_line/src/features/home/data/movie_repository.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  final MovieRepository movieRepository = ApiMovieRepository();

  void loadMovieDetail(int id) async {
    emit(MovieDetailsLoading());
    try {
      final movieDetail = await movieRepository.getMovieDetail(id);
      emit(MovieDetailsLoaded(movieDetail));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
