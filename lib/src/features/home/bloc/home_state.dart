part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
}

final class HomeInitialDataLoadedState extends HomeState {
  final List<GenreModel> genres;
  final List<MovieModel> movies;

  HomeInitialDataLoadedState({required this.genres, required this.movies});
}

final class HomeMoviesByGenreLoadedState extends HomeState {
  final List<MovieModel> movies;

  HomeMoviesByGenreLoadedState(this.movies);
}

final class HomeMovieDetailsLoadedState extends HomeState {
  final MovieDetailModel movie;

  HomeMovieDetailsLoadedState(this.movie);
}

final class HomeMovieSearchResultState extends HomeState {
  final List<MovieModel> movies;

  HomeMovieSearchResultState(this.movies);
}
