import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/common/utils/string_formater.dart';
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

  void loadMoviesByGenre(
    int page, {
    int? genreId,
    String? year,
    int? maxRuntime,
    int? minRuntime,
    String? region,
  }) async {
    emit(HomeMovieLoadingState());
    try {
      final movies = await movieRepository.discoverMovies(page,
          genre: genreId,
          year: year,
          maxRuntime: maxRuntime,
          minRuntime: minRuntime,
          region: region);
      emit(HomeMovieLoadedState(movies, page));
    } catch (e) {
      emit(HomeMovieErrorState(e.toString()));
    }
  }

  void loadMoviesBySearch(
    String text,
    int page, {
    String? language,
    String? region,
  }) async {
    emit(HomeMovieLoadingState());
    try {
      final query = StringFormater.textToQuery(text);
      final movies = await movieRepository.searchMovieByName(
        query,
        page,
        language: language,
        region: region,
      );
      emit(HomeMovieLoadedState(movies, page));
    } catch (e) {
      emit(HomeMovieErrorState(e.toString()));
    }
  }
}
