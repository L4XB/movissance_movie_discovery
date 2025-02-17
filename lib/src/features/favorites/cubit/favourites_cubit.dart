import 'package:bloc/bloc.dart';
import 'package:vibration/vibration.dart';

class FavouritesCubit extends Cubit<List<int>> {
  FavouritesCubit() : super([]);

  /// TODO: Shared Pref und Repo einbauen um die Daten der Favoriten zu laden

  void addFavourite(int movieId) {
    if (!state.contains(movieId)) {
      emit(List.from(state)..add(movieId));
      _vibrate();
    }
  }

  void removeFavourite(int movieId) {
    if (state.contains(movieId)) {
      emit(List.from(state)..remove(movieId));
      _vibrate();
    }
  }

  void _vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 100);
    }
  }
}
