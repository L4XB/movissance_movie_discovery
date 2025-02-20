import 'package:flutter/material.dart';

class CustomThemeColorsExtension
    extends ThemeExtension<CustomThemeColorsExtension> {
  final Color? myTextColor;

  CustomThemeColorsExtension({
    required this.myTextColor,
  });

  @override
  ThemeExtension<CustomThemeColorsExtension> copyWith({Color? myTextColor}) {
    return CustomThemeColorsExtension(
      myTextColor: myTextColor ?? this.myTextColor,
    );
  }

  @override
  ThemeExtension<CustomThemeColorsExtension> lerp(
      ThemeExtension<CustomThemeColorsExtension>? other, double t) {
    if (other is! CustomThemeColorsExtension) {
      return this;
    }
    return CustomThemeColorsExtension(
      myTextColor: Color.lerp(myTextColor, other.myTextColor, t),
    );
  }
}
