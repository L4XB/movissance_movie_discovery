import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/common/utils/string_formater.dart';
import 'package:red_line/src/features/home/data/api_genre_repository.dart';
import 'package:red_line/src/features/home/data/api_movie_repository.dart';
import 'package:red_line/src/features/home/data/genre_repository.dart';
import 'package:red_line/src/features/home/data/movie_repository.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';
import 'package:red_line/src/features/home/domain/movie_detail_model.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialLoadingEvent>(loadInitialHomeData);
    on<SelectGenreEvent>(loadMoviesByGenre);
    on<SelectMovieEvent>(loadMovieDetails);
    on<SearchMovieEvent>(loadMoviesBySearchQuery);
  }

  GenreRepository genreRepository = ApiGenreRepository();
  MovieRepository movieRepository = ApiMovieRepository();

  FutureOr<void> loadInitialHomeData(
      HomeInitialLoadingEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final genres = await genreRepository.getAllGenres();
      final movies = await movieRepository.getPopularMovies();
      emit(HomeInitialDataLoadedState(genres: genres, movies: movies));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  FutureOr<void> loadMoviesByGenre(
      SelectGenreEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final movies = await movieRepository.discoverMovies(
          event.page, event.genre.id, null);
      emit(HomeMoviesByGenreLoadedState(movies));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  FutureOr<void> loadMovieDetails(
      SelectMovieEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final movie = await movieRepository.getMovieDetail(event.movieId);
      emit(HomeMovieDetailsLoadedState(movie));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  FutureOr<void> loadMoviesBySearchQuery(
      SearchMovieEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final query = StringFormater.textToQuery(event.query);
      final movies = await movieRepository.searchMovieByName(query);
      emit(HomeMovieSearchResultState(movies));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
