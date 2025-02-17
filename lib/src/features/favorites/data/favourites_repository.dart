abstract class FavouritesRepository {
  Future<void> addFavourite(int movieId);
  Future<void> removeFavourite(int movieId);
  Future<List<int>> getFavourites();
}
