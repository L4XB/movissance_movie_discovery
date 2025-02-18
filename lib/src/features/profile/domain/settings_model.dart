class SettingsModel {
  final bool isDarkMode;
  final bool isNotificationEnabled;
  final String profileImagePath;

  SettingsModel({
    required this.isDarkMode,
    required this.isNotificationEnabled,
    required this.profileImagePath,
  });

  SettingsModel copyWith({
    bool? isDarkMode,
    bool? isNotificationEnabled,
    bool? isLocationEnabled,
  }) {
    return SettingsModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isNotificationEnabled:
          isNotificationEnabled ?? this.isNotificationEnabled,
      profileImagePath: profileImagePath,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsModel &&
        other.isDarkMode == isDarkMode &&
        other.isNotificationEnabled == isNotificationEnabled;
  }

  @override
  int get hashCode => isDarkMode.hashCode ^ isNotificationEnabled.hashCode;
}
