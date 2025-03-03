part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

/// initial state of the cubit
final class MovieDetailsInitial extends MovieDetailsState {}

/// loading state of the cubit
final class MovieDetailsLoading extends MovieDetailsState {}

/// loaded state of the cubit
final class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailModel movie;

  MovieDetailsLoaded(this.movie);
}

/// error state of the cubit
final class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
