part of 'favourites_data_cubit.dart';

@immutable
sealed class FavouritesDataState {}

final class FavouritesDataInitial extends FavouritesDataState {}

final class FavouritesDataLoading extends FavouritesDataState {}

final class FavouritesDataLoaded extends FavouritesDataState {
  final List<MovieModel> movies;

  FavouritesDataLoaded(this.movies);
}

final class FavouritesDataError extends FavouritesDataState {
  final String message;

  FavouritesDataError(this.message);
}
