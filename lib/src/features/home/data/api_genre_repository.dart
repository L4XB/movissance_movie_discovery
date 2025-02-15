import 'package:dio/dio.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/home/data/genre_repository.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';

class ApiGenreRepository implements GenreRepository {
  @override
  Future<List<GenreModel>> getAllGenres() async {
    final Response response = await Dio().get(
        "$theMovieDatabaseApiBaseURL/genre/movie/list",
        queryParameters: {"api_key": theMovieDatabaseApiKey});

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<GenreModel> genres = (response.data["genres"] as List)
          .map((genre) => GenreModel.fromJson(genre))
          .toList();
      return genres;
    } else {
      throw Exception("Failed to load genres");
    }
  }
}
