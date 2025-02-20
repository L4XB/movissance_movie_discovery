import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

abstract class FavouritesDataRepository {
  Future<List<MovieDetailModel>> getFavouritesData(List<int> favourites);
}
