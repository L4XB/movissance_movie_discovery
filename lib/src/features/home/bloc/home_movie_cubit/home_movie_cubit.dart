import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/home/data/api_movie_repository.dart';
import 'package:red_line/src/features/home/data/movie_repository.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';

part 'home_movie_state.dart';

class HomeMovieCubit extends Cubit<HomeMovieState> {
  HomeMovieCubit() : super(HomeMovieInitial());

  MovieRepository movieRepository = ApiMovieRepository();

  void loadMovies(int page) async {
    emit(HomeMovieLoadingState());
    try {
      final movies = await movieRepository.getPopularMovies(page);
      emit(HomeMovieLoadedState(movies, page));
    } catch (e) {
      emit(HomeMovieErrorState(e.toString()));
    }
  }
}
