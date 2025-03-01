abstract class FavouritesRepository {
  Future<void> addFavourite(String userId, int movieId);
  Future<void> removeFavourite(String userId, int movieId);
  Stream<List<int>> getFavourites(String userId);
}
