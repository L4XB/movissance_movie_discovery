part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeInitialLoadingEvent extends HomeEvent {}

final class SelectGenreEvent extends HomeEvent {
  final int page;
  final GenreModel genre;

  SelectGenreEvent(this.genre, this.page);
}
