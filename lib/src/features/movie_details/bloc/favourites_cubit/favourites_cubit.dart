import 'package:bloc/bloc.dart';

class FavouritesCubit extends Cubit<List<int>> {
  FavouritesCubit() : super([]);

  /// TODO: Shared Pref und Repo einbauen um die Daten der Favoriten zu laden

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
