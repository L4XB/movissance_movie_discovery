import 'package:red_line/src/features/home/domain/genre_model.dart';

abstract class GenreRepository {
  /// fetches all the genres from the API
  /// [returns] a list of [GenreModel]
  Future<List<GenreModel>> getAllGenres();
}
