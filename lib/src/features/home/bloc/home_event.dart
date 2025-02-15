part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeInitialLoadingEvent extends HomeEvent {}

final class SelectGenreEvent extends HomeEvent {
  final int page;
  final GenreModel genre;

  SelectGenreEvent(this.genre, this.page);
}

final class SelectMovieEvent extends HomeEvent {
  final int movieId;

  SelectMovieEvent(this.movieId);
}

final class SearchMovieEvent extends HomeEvent {
  final int page;
  final String query;

  SearchMovieEvent(this.query, this.page);
}

final class LoadMoreMoviesEvent extends HomeEvent {
  final int currentPage;
  final GenreModel genre;

  LoadMoreMoviesEvent(this.genre, this.currentPage);
}

final class LoadTopRatedMoviesEvent extends HomeEvent {
  final int page;

  LoadTopRatedMoviesEvent(this.page);
}
