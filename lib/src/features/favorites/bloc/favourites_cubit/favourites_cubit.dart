import 'package:bloc/bloc.dart';
import 'package:red_line/src/features/favorites/data/favourites_repository.dart';
import 'package:red_line/src/features/favorites/data/shared_preferences_favourites_reposiotry.dart';
import 'package:vibration/vibration.dart';

class FavouritesCubit extends Cubit<List<int>> {
  FavouritesCubit() : super([]);

  final FavouritesRepository _favouritesRepository =
      SharedPreferencesFavouritesReposiotry();

  void addFavourite(int movieId) async {
    if (!state.contains(movieId)) {
      emit(List.from(state)..add(movieId));
      await _favouritesRepository.addFavourite(movieId);
      _vibrate();
    }
  }

  void removeFavourite(int movieId) async {
    if (state.contains(movieId)) {
      emit(List.from(state)..remove(movieId));
      await _favouritesRepository.removeFavourite(movieId);
      _vibrate();
    }
  }

  void loadStoredFavourites() async {
    final List<int> favourites = await _favouritesRepository.getFavourites();
    emit(favourites);
  }

  void _vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 100);
    }
  }
}
