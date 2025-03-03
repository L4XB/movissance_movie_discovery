import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/profile/data/profile_repository.dart';
import 'package:red_line/src/features/profile/data/shared_prefs_profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ProfileRepository profileRepository = SharedPrefsProfileRepository();

  /// loads the profile settings from the shared preferences
  Future<void> loadProfileSettings() async {
    final isDarkMode = await profileRepository.getDarkMode();
    final isNotificationsEnabled =
        await profileRepository.getNotificationsEnabled();
    final countryCode = await profileRepository.getCountryCode();
    emit(ProfileLoaded(isDarkMode, isNotificationsEnabled, countryCode));
  }

  /// updates the dark mode setting
  /// [isDarkMode] is the new dark mode setting
  Future<void> updateDarkMode(bool isDarkMode) async {
    await profileRepository.setDarkMode(isDarkMode);
    emit((state as ProfileLoaded).copyWith(isDarkMode: isDarkMode));
  }

  /// updates the notifications setting
  /// [isEnabled] is the new notifications setting
  Future<void> updateNotificationsEnabled(bool isEnabled) async {
    await profileRepository.setNotificationsEnabled(isEnabled);
    emit((state as ProfileLoaded).copyWith(isNotificationsEnabled: isEnabled));
  }

  /// updates the country code setting
  /// [countryCode] is the new country code setting
  Future<void> updateCountryCode(String countryCode) async {
    await profileRepository.setCountryCode(countryCode);
    emit((state as ProfileLoaded).copyWith(countryCode: countryCode));
  }

  /// resets the cubit
  void reset() {
    emit(ProfileInitial());
  }

  /// clears all the data stored in the shared preferences
  Future<void> clearData() async {
    await profileRepository.clearData();
    emit(ProfileInitial());
  }
}
