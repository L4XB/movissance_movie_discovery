import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/profile/data/profile_repository.dart';
import 'package:red_line/src/features/profile/data/shared_prefs_profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ProfileRepository profileRepository = SharedPrefsProfileRepository();

  Future<void> loadProfileSettings() async {
    final isDarkMode = await profileRepository.getDarkMode();
    final isNotificationsEnabled =
        await profileRepository.getNotificationsEnabled();
    final countryCode = await profileRepository.getCountryCode();
    emit(ProfileLoaded(isDarkMode, isNotificationsEnabled, countryCode));
  }

  Future<void> updateDarkMode(bool isDarkMode) async {
    await profileRepository.setDarkMode(isDarkMode);
    emit((state as ProfileLoaded).copyWith(isDarkMode: isDarkMode));
  }

  Future<void> updateNotificationsEnabled(bool isEnabled) async {
    await profileRepository.setNotificationsEnabled(isEnabled);
    emit((state as ProfileLoaded).copyWith(isNotificationsEnabled: isEnabled));
  }

  Future<void> updateCountryCode(String countryCode) async {
    await profileRepository.setCountryCode(countryCode);
    emit((state as ProfileLoaded).copyWith(countryCode: countryCode));
  }
}
