import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

void main() {
  group('ProviderModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'link': 'http://example.com',
        'flatrate': [
          {
            'logo_path': '',
            'provider_id': 1,
            'provider_name': 'Provider1',
            'display_priority': 0
          }
        ],
        'rent': [],
        'buy': []
      };

      final providerModel = ProviderModel.fromJson(json);

      expect(providerModel.link, 'http://example.com');
      expect(providerModel.flatrate.first.providerName, 'Provider1');
      expect(providerModel.rent.isEmpty, true);
      expect(providerModel.buy.isEmpty, true);
    });

    test('toJson converts an instance to JSON', () {
      final providerModel = ProviderModel(
        link: 'http://example.com',
        flatrate: [
          Provider(
            logoPath: '',
            providerId: 1,
            providerName: 'Provider1',
            displayPriority: 0,
          )
        ],
        rent: [],
        buy: [],
      );

      final json = providerModel.toJson();

      expect(json['link'], 'http://example.com');
      expect(json['flatrate'].first['provider_name'], 'Provider1');
      expect(json['rent'].isEmpty, true);
      expect(json['buy'].isEmpty, true);
    });
  });
}
