import 'package:bloc/bloc.dart';

class FavouritesCubit extends Cubit<List<int>> {
  FavouritesCubit() : super([]);

  /// TODO: Shared Pref und Repo einbauen

  void addFavourite(int movieId) {
    if (!state.contains(movieId)) {
      emit(List.from(state)..add(movieId));
    }
  }

  void removeFavourite(int movieId) {
    if (state.contains(movieId)) {
      emit(List.from(state)..remove(movieId));
    }
  }
}
