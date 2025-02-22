part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final bool isDarkMode;
  final bool isNotificationsEnabled;
  final String countryCode;

  ProfileLoaded(this.isDarkMode, this.isNotificationsEnabled, this.countryCode);

  ProfileLoaded copyWith({
    bool? isDarkMode,
    bool? isNotificationsEnabled,
    String? countryCode,
  }) {
    return ProfileLoaded(
      isDarkMode ?? this.isDarkMode,
      isNotificationsEnabled ?? this.isNotificationsEnabled,
      countryCode ?? this.countryCode,
    );
  }
}
