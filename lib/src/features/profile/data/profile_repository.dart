abstract class ProfileRepository {
  /// sets/updates the dark mode preference.
  /// [isDarkMode] true if dark mode is enabled, false otherwise.
  Future<void> setDarkMode(bool isDarkMode);

  /// sets/updates the notifications preference.
  /// [isEnabled] true if notifications are enabled, false otherwise.
  Future<void> setNotificationsEnabled(bool isEnabled);

  /// sets/updates the country code preference.
  /// [countryCode] the country code.
  Future<void> setCountryCode(String countryCode);

  /// [returns] the dark mode preference.
  Future<bool> getDarkMode();

  /// [returns] the notifications preference.
  Future<bool> getNotificationsEnabled();

  /// [returns] the country code preference.
  Future<String> getCountryCode();

  /// clears all the data stored in the database.
  Future<void> clearData();
}
