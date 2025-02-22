import 'package:red_line/src/features/profile/data/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsProfileRepository implements ProfileRepository {
  static const String darkModeKey = 'darkMode';
  static const String notificationsKey = 'notifications';
  static const String countryCodeKey = 'countryCode';

  @override
  Future<void> setDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkModeKey, isDarkMode);
  }

  @override
  Future<void> setNotificationsEnabled(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(notificationsKey, isEnabled);
  }

  @override
  Future<void> setCountryCode(String countryCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(countryCodeKey, countryCode);
  }

  @override
  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkModeKey) ?? false;
  }

  @override
  Future<bool> getNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(notificationsKey) ?? true;
  }

  @override
  Future<String> getCountryCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(countryCodeKey) ?? 'US';
  }
}
