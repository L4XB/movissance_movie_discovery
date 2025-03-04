import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';

void main() {
  group('GenreModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'id': 1,
        'name': 'Action',
      };

      final genre = GenreModel.fromJson(json);

      expect(genre.id, 1);
      expect(genre.name, 'Action');
    });

    test('toJson converts an instance to JSON', () {
      final genre = GenreModel(id: 1, name: 'Action');

      final json = genre.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Action');
    });
  });
}
