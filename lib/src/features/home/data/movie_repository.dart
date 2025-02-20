import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> searchMovieByName(
    String query,
    int page, {
    String? language,
    String? region,
  });
  Future<List<MovieModel>> getPopularMovies(int page, {String? region});
  Future<List<MovieModel>> getTopRatedMovies(int page);
  Future<List<MovieModel>> getUpcomingMovies(int page);
  Future<List<MovieModel>> discoverMovies(int page,
      {int? genre,
      String? year,
      int? maxRuntime,
      int? minRuntime,
      String? region});
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<MovieModel>> getSimilarMovies(int id, int page);
}
