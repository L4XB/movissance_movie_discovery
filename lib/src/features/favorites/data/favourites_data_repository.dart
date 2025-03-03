import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

abstract class FavouritesDataRepository {
  /// fetches the details of the movies from the API
  /// [favourites] is a list of movie ids
  /// [returns] a list of [MovieDetailModel]
  Future<List<MovieDetailModel>> getFavouritesData(List<int> favourites);
}
