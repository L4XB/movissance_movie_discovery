import 'package:red_line/src/features/home/domain/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> searchMovieByName(String query);
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<List<MovieModel>> discoverMovies(
      int page, String? genre, String? year);
  Future<MovieModel> getMovieDetail(int id);
  Future<List<MovieModel>> getSimilarMovies(int id);
}
