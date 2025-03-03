part of 'home_genre_cubit.dart';

@immutable
sealed class HomeGenreState {}

/// initial state of the cubit
final class HomeGenreInitial extends HomeGenreState {}

/// loading state of the cubit
final class HomeGenreLoading extends HomeGenreState {}

/// loaded state of the cubit
final class HomeGenreLoaded extends HomeGenreState {
  final List<GenreModel> genres;
  final int page;

  HomeGenreLoaded(this.genres, this.page);
}

/// error state of the cubit
final class HomeGenreError extends HomeGenreState {
  final String message;

  HomeGenreError(this.message);
}

/// selected state of the cubit
final class HomeGenreSelected extends HomeGenreState {
  final GenreModel genre;
  final List<GenreModel> genres;
  final int page;

  HomeGenreSelected(this.genre, this.genres, this.page);
}
