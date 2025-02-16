import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/home/data/api_genre_repository.dart';
import 'package:red_line/src/features/home/data/genre_repository.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';

part 'home_genre_state.dart';

class HomeGenreCubit extends Cubit<HomeGenreState> {
  HomeGenreCubit() : super(HomeGenreInitial());

  GenreRepository genreRepository = ApiGenreRepository();

  void loadGenres(int page) async {
    emit(HomeGenreLoading());
    try {
      final genres = await genreRepository.getAllGenres();
      emit(HomeGenreLoaded(genres, page));
    } catch (e) {
      emit(HomeGenreError(e.toString()));
    }
  }
}
