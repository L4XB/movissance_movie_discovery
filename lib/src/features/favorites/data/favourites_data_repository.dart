import 'package:red_line/src/features/home/domain/movie_model.dart';

abstract class FavouritesDataRepository {
  Future<List<MovieModel>> getFavouritesData(List<int> favourites);
}
