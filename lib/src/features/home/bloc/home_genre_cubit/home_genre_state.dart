part of 'home_genre_cubit.dart';

@immutable
sealed class HomeGenreState {}

final class HomeGenreInitial extends HomeGenreState {}

final class HomeGenreLoading extends HomeGenreState {}

final class HomeGenreLoaded extends HomeGenreState {
  final List<GenreModel> genres;
  final int page;

  HomeGenreLoaded(this.genres, this.page);
}

final class HomeGenreError extends HomeGenreState {
  final String message;

  HomeGenreError(this.message);
}
