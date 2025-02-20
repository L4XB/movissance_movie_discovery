import 'package:dio/dio.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/features/home/data/movie_repository.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

class ApiMovieRepository implements MovieRepository {
  @override
  Future<List<MovieModel>> discoverMovies(int page,
      {int? genre,
      String? year,
      int? maxRuntime,
      int? minRuntime,
      String? region}) async {
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

    if (maxRuntime != null) {
      queryParameters["with_runtime.lte"] = maxRuntime;
    }

    if (minRuntime != null) {
      queryParameters["with_runtime.gte"] = minRuntime;
    }

    if (region != null) {
      queryParameters["region"] = region;
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
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final Response response = await Dio().get(
        "$theMovieDatabaseApiBaseURL/movie/$id",
        queryParameters: {"api_key": theMovieDatabaseApiKey});

    if (response.statusCode == 200 || response.statusCode == 201) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load movie detail");
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies(int page) async {
    final Response response = await Dio()
        .get("$theMovieDatabaseApiBaseURL/movie/popular", queryParameters: {
      "api_key": theMovieDatabaseApiKey,
      "page": page,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<MovieModel> movies = (response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int id, int page) async {
    final Response response = await Dio().get(
        "$theMovieDatabaseApiBaseURL/movie/$id/recommendations",
        queryParameters: {
          "api_key": theMovieDatabaseApiKey,
          "page": page,
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<MovieModel> movies = (response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw Exception("Failed to load similar movies");
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies(int page) async {
    final Response response = await Dio()
        .get("$theMovieDatabaseApiBaseURL/movie/top_rated", queryParameters: {
      "api_key": theMovieDatabaseApiKey,
      "page": page,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<MovieModel> movies = (response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw Exception("Failed to load top rated movies");
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies(int page) async {
    final Response response = await Dio()
        .get("$theMovieDatabaseApiBaseURL/movie/upcoming", queryParameters: {
      "api_key": theMovieDatabaseApiKey,
      "page": page,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<MovieModel> movies = (response.data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw Exception("Failed to load upcoming movies");
    }
  }

  @override
  Future<List<MovieModel>> searchMovieByName(
    String query,
    int page, {
    String? language,
    String? region,
  }) async {
    final Map<String, dynamic> queryParameters = {
      "api_key": theMovieDatabaseApiKey,
      "query": query,
      "page": page,
    };

    if (language != null) {
      queryParameters["language"] = language;
    }

    if (region != null) {
      queryParameters["region"] = region;
    }

    final Response response = await Dio().get(
        "$theMovieDatabaseApiBaseURL/search/movie",
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
}
