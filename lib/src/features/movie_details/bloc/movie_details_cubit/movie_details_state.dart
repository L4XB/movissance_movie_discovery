part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailModel movie;

  MovieDetailsLoaded(this.movie);
}

final class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
