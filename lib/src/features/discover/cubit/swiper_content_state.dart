part of 'swiper_content_cubit.dart';

@immutable
sealed class SwiperContentState {}

/// initial state of the cubit
final class SwiperContentInitial extends SwiperContentState {}

/// loading state of the cubit
final class SwiperContentLoading extends SwiperContentState {}

/// loaded state of the cubit
final class SwiperContentLoaded extends SwiperContentState {
  final List<MovieModel> movies;
  final int page;
  final int index;

  SwiperContentLoaded(this.movies, this.page, this.index);
}

/// error state of the cubit
final class SwiperContentError extends SwiperContentState {
  final String message;

  SwiperContentError(this.message);
}
