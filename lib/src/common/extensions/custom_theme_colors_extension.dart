import 'package:flutter/material.dart';

class CustomThemeColorsExtension
    extends ThemeExtension<CustomThemeColorsExtension> {
  final Color? mainBackGroundColor;
  final Color? secondaryBackgroundColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? mainTextColor;
  final Color? secondaryLabelColor;
  final Color? buttonBackgroundColor;
  final Color? inputFieldBorderColor;
  final Color? inputFieldFillColor;
  final Color? mainIconColor;
  final Color? headLineTextColor;
  final Color? starIconColor;
  final Color? cardColor;
  final Color? contrastTextColor;

  CustomThemeColorsExtension({
    required this.mainBackGroundColor,
    required this.secondaryBackgroundColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.secondaryLabelColor,
    required this.mainTextColor,
    required this.buttonBackgroundColor,
    required this.inputFieldBorderColor,
    required this.inputFieldFillColor,
    required this.mainIconColor,
    required this.headLineTextColor,
    required this.starIconColor,
    required this.cardColor,
    required this.contrastTextColor,
  });

  @override
  ThemeExtension<CustomThemeColorsExtension> copyWith({
    Color? mainBackGroundColor,
    Color? primaryColor,
    Color? secondaryColor,
    Color? secondaryLabelColor,
    Color? mainTextColor,
    Color? buttonBackgroundColor,
    Color? inputFieldBorderColor,
    Color? inputFieldFillColor,
    Color? mainIconColor,
    Color? secondaryBackgroundColor,
    Color? headLineTextColor,
    Color? starIconColor,
    Color? cardColor,
    Color? contrastTextColor,
  }) {
    return CustomThemeColorsExtension(
      mainBackGroundColor: mainBackGroundColor ?? this.mainBackGroundColor,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      secondaryLabelColor: secondaryLabelColor ?? this.secondaryLabelColor,
      mainTextColor: mainTextColor ?? this.mainTextColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      inputFieldBorderColor:
          inputFieldBorderColor ?? this.inputFieldBorderColor,
      inputFieldFillColor: inputFieldFillColor ?? this.inputFieldFillColor,
      mainIconColor: mainIconColor ?? this.mainIconColor,
      secondaryBackgroundColor:
          secondaryBackgroundColor ?? this.secondaryBackgroundColor,
      headLineTextColor: headLineTextColor ?? this.headLineTextColor,
      starIconColor: starIconColor ?? this.starIconColor,
      cardColor: cardColor ?? this.cardColor,
      contrastTextColor: contrastTextColor ?? this.contrastTextColor,
    );
  }

  @override
  ThemeExtension<CustomThemeColorsExtension> lerp(
      ThemeExtension<CustomThemeColorsExtension>? other, double t) {
    if (other is! CustomThemeColorsExtension) {
      return this;
    }
    return CustomThemeColorsExtension(
      mainBackGroundColor:
          Color.lerp(mainBackGroundColor, other.mainBackGroundColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      secondaryLabelColor:
          Color.lerp(secondaryLabelColor, other.secondaryLabelColor, t),
      mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t),
      buttonBackgroundColor:
          Color.lerp(buttonBackgroundColor, other.buttonBackgroundColor, t),
      inputFieldBorderColor:
          Color.lerp(inputFieldBorderColor, other.inputFieldBorderColor, t),
      inputFieldFillColor:
          Color.lerp(inputFieldFillColor, other.inputFieldFillColor, t),
      mainIconColor: Color.lerp(mainIconColor, other.mainIconColor, t),
      secondaryBackgroundColor: Color.lerp(
          secondaryBackgroundColor, other.secondaryBackgroundColor, t),
      headLineTextColor:
          Color.lerp(headLineTextColor, other.headLineTextColor, t),
      starIconColor: Color.lerp(starIconColor, other.starIconColor, t),
      cardColor: Color.lerp(cardColor, other.cardColor, t),
      contrastTextColor:
          Color.lerp(contrastTextColor, other.contrastTextColor, t),
    );
  }
}
