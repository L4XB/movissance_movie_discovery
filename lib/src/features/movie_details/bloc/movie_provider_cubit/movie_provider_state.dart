part of 'movie_provider_cubit.dart';

@immutable
sealed class MovieProviderState {}

final class MovieProviderInitial extends MovieProviderState {}

final class MovieProviderLoading extends MovieProviderState {}

final class MovieProviderLoaded extends MovieProviderState {
  final ProviderModel provider;

  MovieProviderLoaded(this.provider);
}

final class MovieProviderError extends MovieProviderState {
  final String message;

  MovieProviderError(this.message);
}
