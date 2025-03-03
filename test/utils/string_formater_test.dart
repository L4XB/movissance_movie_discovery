import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/common/utils/string_formater.dart';

void main() {
  group('StringFormater', () {
    test('textToQuery should replace spaces with +', () {
      final result = StringFormater.textToQuery('star wars');
      expect(result, 'star+wars');
    });

    test('minutesToHours should convert minutes to hours and minutes', () {
      final result = StringFormater.minutesToHours(125);
      expect(result, '2h 5m');
    });

    test('minutesToHours should handle zero minutes', () {
      final result = StringFormater.minutesToHours(0);
      expect(result, '0h 0m');
    });

    test('minutesToHours should handle exactly one hour', () {
      final result = StringFormater.minutesToHours(60);
      expect(result, '1h 0m');
    });
  });
}
