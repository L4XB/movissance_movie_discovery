part of 'swiper_content_cubit.dart';

@immutable
sealed class SwiperContentState {}

final class SwiperContentInitial extends SwiperContentState {}

final class SwiperContentLoading extends SwiperContentState {}

final class SwiperContentLoaded extends SwiperContentState {
  final List<MovieModel> movies;
  final int page;

  SwiperContentLoaded(this.movies, this.page);
}

final class SwiperContentError extends SwiperContentState {
  final String message;

  SwiperContentError(this.message);
}
