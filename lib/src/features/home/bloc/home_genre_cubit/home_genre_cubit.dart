import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/home/data/api_genre_repository.dart';
import 'package:red_line/src/features/home/data/genre_repository.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';

part 'home_genre_state.dart';

class HomeGenreCubit extends Cubit<HomeGenreState> {
  HomeGenreCubit() : super(HomeGenreInitial());

  GenreRepository genreRepository = ApiGenreRepository();

  /// used to select a genre in the UI
  /// [genre] is the selected genre
  void selectGenre(GenreModel genre) {
    final currentState = state;
    if (currentState is HomeGenreLoaded) {
      emit(HomeGenreSelected(genre, currentState.genres, currentState.page));
    } else if (currentState is HomeGenreSelected) {
      emit(HomeGenreSelected(genre, currentState.genres, currentState.page));
    }
  }

  /// used to unselect a genre in the UI
  void unselectAllGenres() {
    final currentState = state;
    if (currentState is HomeGenreSelected) {
      emit(HomeGenreLoaded(currentState.genres, currentState.page));
    }
  }

  /// loads the genres from the API
  /// [page] is the page of the genres
  void loadGenres(int page) async {
    emit(HomeGenreLoading());
    try {
      final genres = await genreRepository.getAllGenres();
      emit(HomeGenreLoaded(genres, page));
    } catch (e) {
      emit(HomeGenreError(e.toString()));
    }
  }

  /// resets the state of the cubit
  void reset() {
    emit(HomeGenreInitial());
  }
}
