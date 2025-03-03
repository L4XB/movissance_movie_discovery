abstract class FavouritesRepository {
  /// adds a movie to the user's favourites list.
  /// throws an exception if the movie could not be added.
  /// [userId] the id of the user.
  /// [movieId] the id of the movie.
  Future<void> addFavourite(String userId, int movieId);

  /// removes a movie from the user's favourites list.
  /// throws an exception if the movie could not be removed.
  /// [userId] the id of the user.
  /// [movieId] the id of the movie.
  Future<void> removeFavourite(String userId, int movieId);

  /// [returns] a stream of the user's favourite movies.
  /// [userId] the id of the user.
  Stream<List<int>> getFavourites(String userId);
}
