import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/home/data/api_movie_repository.dart';
import 'package:red_line/src/features/home/data/movie_repository.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';

part 'swiper_content_state.dart';

class SwiperContentCubit extends Cubit<SwiperContentState> {
  SwiperContentCubit() : super(SwiperContentInitial());

  final MovieRepository _movieRepository = ApiMovieRepository();
  final Random _random = Random();
  int _currentPage = 1;

  Future<void> loadMovies() async {
    try {
      emit(SwiperContentLoading());
      final movies = await _fetchRandomCategoryMovies(_currentPage);
      emit(SwiperContentLoaded(movies, _currentPage));
    } catch (e) {
      emit(SwiperContentError(e.toString()));
    }
  }

  Future<void> loadMoreMovies() async {
    if (state is SwiperContentLoaded) {
      try {
        final currentState = state as SwiperContentLoaded;
        final newMovies = await _fetchRandomCategoryMovies(_currentPage + 1);
        final allMovies = List<MovieModel>.from(currentState.movies)
          ..addAll(newMovies);
        _currentPage++;
        emit(SwiperContentLoaded(allMovies, _currentPage));
      } catch (e) {
        emit(SwiperContentError(e.toString()));
      }
    }
  }

  Future<List<MovieModel>> _fetchRandomCategoryMovies(int page) async {
    final categories = ['top_rated', 'upcoming', 'popular'];
    final category = categories[_random.nextInt(categories.length)];
    switch (category) {
      case 'top_rated':
        return await _movieRepository.getTopRatedMovies(page);
      case 'upcoming':
        return await _movieRepository.getUpcomingMovies(page);
      case 'popular':
        return await _movieRepository.getPopularMovies(page);
      default:
        throw Exception('Unknown category');
    }
  }

  void checkAndLoadMoreMovies(int remainingMovies) {
    if (remainingMovies <= 5) {
      loadMoreMovies();
    }
  }
}
