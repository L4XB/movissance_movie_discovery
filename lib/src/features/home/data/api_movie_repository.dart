import 'package:dio/dio.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/home/data/movie_repository.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';

class ApiMovieRepository implements MovieRepository {
  @override
  Future<List<MovieModel>> discoverMovies(
      int page, int? genre, String? year) async {
    final Map<String, dynamic> queryParameters = {
      "api_key": theMovieDatabaseApiKey,
      "page": page,
    };

    if (genre != null) {
      queryParameters["with_genres"] = genre;
    }

    if (year != null) {
      queryParameters["primary_release_year"] = year;
    }

    final Response response = await Dio().get(
        "$theMovieDatabaseApiBaseURL/discover/movie",
        queryParameters: queryParameters);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<MovieModel> movies = (response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Future<MovieModel> getMovieDetail(int id) async {
    final Response response = await Dio().get(
        "$theMovieDatabaseApiBaseURL/movie/$id",
        queryParameters: {"api_key": theMovieDatabaseApiKey});
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int id) {
    // TODO: implement getSimilarMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() {
    // TODO: implement getUpcomingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> searchMovieByName(String query) {
    // TODO: implement searchMovieByName
    throw UnimplementedError();
  }
}
