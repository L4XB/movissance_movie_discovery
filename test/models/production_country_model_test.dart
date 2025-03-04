import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/home/domain/production_country_model.dart';

void main() {
  group('ProductionCountryModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'iso_3166_1': 'US',
        'name': 'United States',
      };

      final country = ProductionCountryModel.fromJson(json);

      expect(country.iso31661, 'US');
      expect(country.name, 'United States');
    });

    test('toJson converts an instance to JSON', () {
      final country =
          ProductionCountryModel(iso31661: 'US', name: 'United States');

      final json = country.toJson();

      expect(json['iso_3166_1'], 'US');
      expect(json['name'], 'United States');
    });
  });
}
