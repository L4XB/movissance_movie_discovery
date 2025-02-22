import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/home/data/api_genre_repository.dart';
import 'package:red_line/src/features/home/data/genre_repository.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';

part 'home_genre_state.dart';

class HomeGenreCubit extends Cubit<HomeGenreState> {
  HomeGenreCubit() : super(HomeGenreInitial());

  GenreRepository genreRepository = ApiGenreRepository();

  void selectGenre(GenreModel genre) {
    final currentState = state;
    if (currentState is HomeGenreLoaded) {
      emit(HomeGenreSelected(genre, currentState.genres, currentState.page));
    } else if (currentState is HomeGenreSelected) {
      emit(HomeGenreSelected(genre, currentState.genres, currentState.page));
    }
  }

  void unselectAllGenres() {
    final currentState = state;
    if (currentState is HomeGenreSelected) {
      emit(HomeGenreLoaded(currentState.genres, currentState.page));
    }
  }

  void loadGenres(int page) async {
    emit(HomeGenreLoading());
    try {
      final genres = await genreRepository.getAllGenres();
      emit(HomeGenreLoaded(genres, page));
    } catch (e) {
      emit(HomeGenreError(e.toString()));
    }
  }

  void reset() {
    emit(HomeGenreInitial());
  }
}
