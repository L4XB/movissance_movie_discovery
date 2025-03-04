import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/home/domain/spoken_languages_model.dart';

void main() {
  group('SpokenLanguageModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'english_name': 'English',
        'iso_639_1': 'en',
        'name': 'English'
      };

      final spokenLanguageModel = SpokenLanguageModel.fromJson(json);

      expect(spokenLanguageModel.englishName, 'English');
      expect(spokenLanguageModel.iso6391, 'en');
      expect(spokenLanguageModel.name, 'English');
    });

    test('toJson converts an instance to JSON', () {
      final spokenLanguageModel = SpokenLanguageModel(
        englishName: 'English',
        iso6391: 'en',
        name: 'English',
      );

      final json = spokenLanguageModel.toJson();

      expect(json['english_name'], 'English');
      expect(json['iso_639_1'], 'en');
      expect(json['name'], 'English');
    });
  });
}
