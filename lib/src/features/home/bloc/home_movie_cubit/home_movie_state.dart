part of 'home_movie_cubit.dart';

@immutable
sealed class HomeMovieState {}

final class HomeMovieInitial extends HomeMovieState {}

final class HomeMovieLoadingState extends HomeMovieState {}

final class HomeMovieLoadedState extends HomeMovieState {
  final int page;
  final List<MovieModel> movies;

  HomeMovieLoadedState(this.movies, this.page);
}

final class HomeMovieErrorState extends HomeMovieState {
  final String message;

  HomeMovieErrorState(this.message);
}
