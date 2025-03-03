part of 'home_movie_cubit.dart';

@immutable
sealed class HomeMovieState {}

/// initial state of the cubit
final class HomeMovieInitial extends HomeMovieState {}

/// loading state of the cubit
final class HomeMovieLoadingState extends HomeMovieState {}

/// loaded state of the cubit
final class HomeMovieLoadedState extends HomeMovieState {
  final int page;
  final List<MovieModel> movies;

  HomeMovieLoadedState(this.movies, this.page);
}

/// error state of the cubit
final class HomeMovieErrorState extends HomeMovieState {
  final String message;

  HomeMovieErrorState(this.message);
}
