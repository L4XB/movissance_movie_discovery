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

  /// current page of the movies from the API
  int _currentPage = 1;

  /// current index of the swiper widget
  int _currentIndex = 0;

  /// loads the movies from the API
  /// is used to load the initial movies
  Future<void> loadMovies() async {
    try {
      emit(SwiperContentLoading());
      final movies = await _fetchRandomCategoryMovies(_currentPage);
      emit(SwiperContentLoaded(movies, _currentPage, _currentIndex));
    } catch (e) {
      emit(SwiperContentError(e.toString()));
    }
  }

  /// loads more movies from the API
  /// is used to load more movies when the user swipes through the movies
  Future<void> loadMoreMovies() async {
    if (state is SwiperContentLoaded) {
      try {
        final currentState = state as SwiperContentLoaded;
        final newMovies = await _fetchRandomCategoryMovies(_currentPage + 1);
        final allMovies = List<MovieModel>.from(currentState.movies)
          ..addAll(newMovies);
        _currentPage++;
        emit(SwiperContentLoaded(allMovies, _currentPage, _currentIndex));
      } catch (e) {
        emit(SwiperContentError(e.toString()));
      }
    }
  }

  /// is used to fetch random movies from the API
  /// the movies are from the categories [top_rated], [upcoming] and [popular]
  /// the [category] is chosen [randomly]
  /// [page] is the page of the movies
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

  /// checks if there are less than 5 movies left
  /// if so, it loads more movies
  /// [remainingMovies] is the number of movies left
  void checkAndLoadMoreMovies(int remainingMovies) {
    if (remainingMovies <= 5) {
      loadMoreMovies();
    }
  }

  /// updates the current index of the swiper widget
  /// [index] is the current index
  void updateCurrentIndex(int index) {
    if (state is SwiperContentLoaded) {
      final currentState = state as SwiperContentLoaded;
      _currentIndex = index;
      emit(SwiperContentLoaded(
          currentState.movies, _currentPage, _currentIndex));
    }
  }

  /// resets the cubit
  void reset() {
    emit(SwiperContentInitial());
  }
}
