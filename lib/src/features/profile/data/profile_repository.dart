abstract class ProfileRepository {
  Future<void> setDarkMode(bool isDarkMode);
  Future<void> setNotificationsEnabled(bool isEnabled);
  Future<void> setCountryCode(String countryCode);

  Future<bool> getDarkMode();
  Future<bool> getNotificationsEnabled();
  Future<String> getCountryCode();
}
