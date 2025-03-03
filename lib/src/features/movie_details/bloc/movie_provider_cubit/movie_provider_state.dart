part of 'movie_provider_cubit.dart';

@immutable
sealed class MovieProviderState {}

/// initial state of the cubit
final class MovieProviderInitial extends MovieProviderState {}

/// loading state of the cubit
final class MovieProviderLoading extends MovieProviderState {}

/// loaded state of the cubit
final class MovieProviderLoaded extends MovieProviderState {
  final ProviderModel provider;

  MovieProviderLoaded(this.provider);
}

/// error state of the cubit
final class MovieProviderError extends MovieProviderState {
  final String message;

  MovieProviderError(this.message);
}
