import 'package:dio/dio.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/features/favorites/data/favourites_data_repository.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

class ApiFavouitesDataRepository implements FavouritesDataRepository {
  @override
  Future<List<MovieDetailModel>> getFavouritesData(List<int> favourites) async {
    List<MovieDetailModel> movies = [];
    for (int favouriteId in favourites) {
      final Response response;
      response = await Dio().get(
          "$theMovieDatabaseApiBaseURL/movie/$favouriteId",
          queryParameters: {
            "api_key": theMovieDatabaseApiKey,
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        movies.add(MovieDetailModel.fromJson(response.data));
      } else {
        throw Exception("Failed to load favourites data");
      }
    }

    return movies;
  }
}
