import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

abstract class MovieRepository {
  /// search for movies by name
  /// [query] is the search query
  /// [page] is the page number
  /// [language] is the language of the search
  /// [region] is the region of the search e.g GB
  /// [returns] a list of [MovieModel]
  Future<List<MovieModel>> searchMovieByName(
    String query,
    int page, {
    String? language,
    String? region,
  });

  /// fetches the popular movies from the API
  /// [page] is the page number
  /// [region] is the region of the search e.g GB
  /// [returns] a list of [MovieModel]
  Future<List<MovieModel>> getPopularMovies(int page, {String? region});

  /// fetches the top rated movies from the API
  /// [page] is the page number
  /// [returns] a list of [MovieModel]
  Future<List<MovieModel>> getTopRatedMovies(int page);

  /// fetches the upcoming movies from the API
  /// [page] is the page number
  /// [returns] a list of [MovieModel]
  Future<List<MovieModel>> getUpcomingMovies(int page);

  /// fetches random some movies from the API
  /// [page] is the page number
  /// [returns] a list of [MovieModel]
  /// [genre] is the genre of the movie e.g 28 for action
  /// [year] is the year of the movie e.g 2021
  /// [maxRuntime] is the maximum runtime of the movie
  /// [minRuntime] is the minimum runtime of the movie
  /// [region] is the region of the movie e.g GB
  Future<List<MovieModel>> discoverMovies(int page,
      {int? genre,
      String? year,
      int? maxRuntime,
      int? minRuntime,
      String? region});

  /// fetches the details of the movies from the API
  /// [id] is the id of the movie
  /// [returns] a [MovieDetailModel]
  Future<MovieDetailModel> getMovieDetail(int id);

  /// fetches the similar movies from the API
  /// [id] is the id of the movie
  /// [page] is the page number
  /// [returns] a list of [MovieModel]
  Future<List<MovieModel>> getSimilarMovies(int id, int page);
}
