import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> searchMovieByName(String query, int page,
      {String? language,
      String? region,
      bool? includeAdult,
      int? withRuntimeGte,
      int? withRuntimeLte});
  Future<List<MovieModel>> getPopularMovies(int page);
  Future<List<MovieModel>> getTopRatedMovies(int page);
  Future<List<MovieModel>> getUpcomingMovies(int page);
  Future<List<MovieModel>> discoverMovies(int page, int? genre, String? year);
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<MovieModel>> getSimilarMovies(int id, int page);
}
