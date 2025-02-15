import 'package:red_line/src/features/home/domain/genre_model.dart';

abstract class GenreRepository {
  Future<List<GenreModel>> getAllGenres();
}
