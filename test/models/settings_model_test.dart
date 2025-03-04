import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/profile/domain/settings_model.dart';

void main() {
  group('SettingsModel', () {
    test('copyWith returns a new instance with updated values', () {
      final settings = SettingsModel(
        isDarkMode: false,
        isNotificationEnabled: true,
        profileImagePath: 'path/to/image',
      );

      final updatedSettings = settings.copyWith(isDarkMode: true);

      expect(updatedSettings.isDarkMode, true);
      expect(updatedSettings.isNotificationEnabled, true);
      expect(updatedSettings.profileImagePath, 'path/to/image');
    });

    test('equality operator returns true for identical objects', () {
      final settings1 = SettingsModel(
        isDarkMode: false,
        isNotificationEnabled: true,
        profileImagePath: 'path/to/image',
      );

      final settings2 = SettingsModel(
        isDarkMode: false,
        isNotificationEnabled: true,
        profileImagePath: 'path/to/image',
      );

      expect(settings1 == settings2, true);
    });

    test('hashCode returns the same value for identical objects', () {
      final settings1 = SettingsModel(
        isDarkMode: false,
        isNotificationEnabled: true,
        profileImagePath: 'path/to/image',
      );

      final settings2 = SettingsModel(
        isDarkMode: false,
        isNotificationEnabled: true,
        profileImagePath: 'path/to/image',
      );

      expect(settings1.hashCode, settings2.hashCode);
    });
  });
}
