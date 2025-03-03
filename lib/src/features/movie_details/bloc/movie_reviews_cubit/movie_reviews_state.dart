part of 'movie_reviews_cubit.dart';

@immutable
sealed class MovieReviewsState {}

/// initial state of the cubit
final class MovieReviewsInitial extends MovieReviewsState {}

/// loading state of the cubit
final class MovieReviewsLoading extends MovieReviewsState {}

/// loaded state of the cubit
final class MovieReviewsLoaded extends MovieReviewsState {
  final List<ReviewModel> reviews;

  MovieReviewsLoaded(this.reviews);
}

/// error state of the cubit
final class MovieReviewsError extends MovieReviewsState {
  final String message;

  MovieReviewsError(this.message);
}
