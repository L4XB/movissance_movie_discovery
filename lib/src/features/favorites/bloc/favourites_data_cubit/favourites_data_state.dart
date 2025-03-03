part of 'favourites_data_cubit.dart';

@immutable
sealed class FavouritesDataState {}

/// initial state of the cubit
final class FavouritesDataInitial extends FavouritesDataState {}

/// loading state of the cubit
final class FavouritesDataLoading extends FavouritesDataState {}

/// loaded state of the cubit
final class FavouritesDataLoaded extends FavouritesDataState {
  final List<MovieDetailModel> movies;

  FavouritesDataLoaded(this.movies);
}

/// error state of the cubit
final class FavouritesDataError extends FavouritesDataState {
  final String message;

  FavouritesDataError(this.message);
}
