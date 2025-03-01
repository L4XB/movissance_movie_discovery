import 'package:bloc/bloc.dart';
import 'package:red_line/src/features/auth/cubit/user_data_cubit.dart';
import 'package:red_line/src/features/favorites/data/favourites_repository.dart';
import 'package:red_line/src/features/favorites/data/firestore_favourites_repository.dart';
import 'package:vibration/vibration.dart';

class FavouritesCubit extends Cubit<List<int>> {
  final FavouritesRepository _favouritesRepository;
  final UserDataCubit _userDataCubit;

  FavouritesCubit(this._userDataCubit)
      : _favouritesRepository = FirestoreFavouritesRepository(),
        super([]);

  void loadInitialFavourites() async {
    final userId = _userDataCubit.state?.uid;
    if (userId != null) {
      _favouritesRepository.getFavourites(userId).listen((favourites) {
        emit(favourites);
      });
    }
  }

  void addFavourite(int movieId) async {
    final userId = _userDataCubit.state?.uid;
    if (userId != null && !state.contains(movieId)) {
      await _favouritesRepository.addFavourite(userId, movieId);
      _vibrate();
    }
  }

  void removeFavourite(int movieId) async {
    final userId = _userDataCubit.state?.uid;
    if (userId != null && state.contains(movieId)) {
      await _favouritesRepository.removeFavourite(userId, movieId);
      _vibrate();
    }
  }

  void _vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 100);
    }
  }

  void reset() {
    emit([]);
  }
}
