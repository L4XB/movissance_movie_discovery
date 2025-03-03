import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/common/utils/runtime_range_calculator.dart';

void main() {
  group('RuntimeRangeCalculator', () {
    test(
        'getRuntimeRange should return null for both min and max for duration 1',
        () {
      final result = RuntimeRangeCalculator.getRuntimeRange(1);
      expect(result, (null, null));
    });

    test(
        'getRuntimeRange should return null for min and 60 for max for duration 2',
        () {
      final result = RuntimeRangeCalculator.getRuntimeRange(2);
      expect(result, (null, 60));
    });

    test(
        'getRuntimeRange should return 60 for min and 120 for max for duration 3',
        () {
      final result = RuntimeRangeCalculator.getRuntimeRange(3);
      expect(result, (60, 120));
    });

    test(
        'getRuntimeRange should return 120 for min and null for max for duration 4',
        () {
      final result = RuntimeRangeCalculator.getRuntimeRange(4);
      expect(result, (120, null));
    });

    test(
        'getRuntimeRange should return null for both min and max for unknown duration',
        () {
      final result = RuntimeRangeCalculator.getRuntimeRange(5);
      expect(result, (null, null));
    });
  });
}
