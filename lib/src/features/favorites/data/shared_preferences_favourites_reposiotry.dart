import 'package:red_line/src/features/favorites/data/favourites_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFavouritesReposiotry implements FavouritesRepository {
  static const String _favouritesKey = 'favourites';

  @override
  Future<void> addFavourite(int movieId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favourites = prefs.getStringList(_favouritesKey) ?? [];
      if (!favourites.contains(movieId.toString())) {
        favourites.add(movieId.toString());
        await prefs.setStringList(_favouritesKey, favourites);
      }
    } catch (e) {
      print('Error adding favourite: $e');
    }
  }

  @override
  Future<List<int>> getFavourites() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favourites = prefs.getStringList(_favouritesKey) ?? [];
      return favourites.map((id) => int.parse(id)).toList();
    } catch (e) {
      print('Error getting favourites: $e');
      return [];
    }
  }

  @override
  Future<void> removeFavourite(int movieId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favourites = prefs.getStringList(_favouritesKey) ?? [];
      if (favourites.contains(movieId.toString())) {
        favourites.remove(movieId.toString());
        await prefs.setStringList(_favouritesKey, favourites);
      }
    } catch (e) {
      print('Error removing favourite: $e');
    }
  }
}
