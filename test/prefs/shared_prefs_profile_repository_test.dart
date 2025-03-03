import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/profile/data/shared_prefs_profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPrefsProfileRepository repository;
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    repository = SharedPrefsProfileRepository();
  });

  test('setDarkMode should save dark mode preference', () async {
    await repository.setDarkMode(true);
    expect(prefs.getBool(SharedPrefsProfileRepository.darkModeKey), true);
  });

  test('getDarkMode should return dark mode preference', () async {
    await prefs.setBool(SharedPrefsProfileRepository.darkModeKey, true);
    final isDarkMode = await repository.getDarkMode();
    expect(isDarkMode, true);
  });

  test('setNotificationsEnabled should save notifications preference',
      () async {
    await repository.setNotificationsEnabled(true);
    expect(prefs.getBool(SharedPrefsProfileRepository.notificationsKey), true);
  });

  test('getNotificationsEnabled should return notifications preference',
      () async {
    await prefs.setBool(SharedPrefsProfileRepository.notificationsKey, true);
    final isEnabled = await repository.getNotificationsEnabled();
    expect(isEnabled, true);
  });

  test('setCountryCode should save country code', () async {
    await repository.setCountryCode('DE');
    expect(prefs.getString(SharedPrefsProfileRepository.countryCodeKey), 'DE');
  });

  test('getCountryCode should return country code', () async {
    await prefs.setString(SharedPrefsProfileRepository.countryCodeKey, 'DE');
    final countryCode = await repository.getCountryCode();
    expect(countryCode, 'DE');
  });
}
