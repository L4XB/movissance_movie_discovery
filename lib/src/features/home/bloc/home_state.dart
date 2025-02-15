part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeInitialDataLoadingState extends HomeState {}

final class HomeInitialDataLoadedState extends HomeState {
  final List<GenreModel> genres;
  final List<MovieModel> movies;

  HomeInitialDataLoadedState({required this.genres, required this.movies});
}

final class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
}
