import 'package:flutter/material.dart';

class CustomThemeColorsExtension
    extends ThemeExtension<CustomThemeColorsExtension> {
  final Color? mainBackGroundColor;
  final Color? secondaryBackgroundColor;
  final Color? thirdBackgroundColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? mainTextColor;
  final Color? secondaryLabelColor;
  final Color? buttonBackgroundColor;
  final Color? inputFieldBorderColor;
  final Color? contrastBorderColor;
  final Color? inputFieldFillColor;
  final Color? mainIconColor;
  final Color? headLineTextColor;
  final Color? starIconColor;
  final Color? cardColor;
  final Color? contrastTextColor;
  final Color? favoritesIconColor;
  final Color? overlayElementBackgroundColor;
  final Color? boxshadowColor;
  final Color? tabBarUnselectedFillColor;
  final Color? tabBarSelectedFillColor;
  final Color? decentLabelColor;
  final Color? secondaryOverlayElementBackgroundColor;
  final Color? discoverPageOverlayColorOne;
  final Color? discoverPageOverlayColorTwo;
  final Color? backButtonBackgroundColor;

  CustomThemeColorsExtension({
    required this.mainBackGroundColor,
    required this.secondaryBackgroundColor,
    required this.thirdBackgroundColor,
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
    required this.favoritesIconColor,
    required this.overlayElementBackgroundColor,
    required this.boxshadowColor,
    required this.tabBarUnselectedFillColor,
    required this.tabBarSelectedFillColor,
    required this.decentLabelColor,
    required this.contrastBorderColor,
    required this.secondaryOverlayElementBackgroundColor,
    required this.discoverPageOverlayColorOne,
    required this.discoverPageOverlayColorTwo,
    required this.backButtonBackgroundColor,
  });

  @override
  ThemeExtension<CustomThemeColorsExtension> copyWith({
    Color? mainBackGroundColor,
    Color? primaryColor,
    Color? secondaryColor,
    Color? secondaryLabelColor,
    Color? thirdBackgroundColor,
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
    Color? favoritesIconColor,
    Color? overlayElementBackgroundColor,
    Color? boxshadowColor,
    Color? tabBarUnselectedFillColor,
    Color? tabBarSelectedFillColor,
    Color? decentLabelColor,
    Color? contrastBorderColor,
    Color? secondaryOverlayElementBackgroundColor,
    Color? discoverPageOverlayColorOne,
    Color? discoverPageOverlayColorTwo,
    Color? backButtonBackgroundColor,
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
      favoritesIconColor: favoritesIconColor ?? this.favoritesIconColor,
      overlayElementBackgroundColor:
          overlayElementBackgroundColor ?? this.overlayElementBackgroundColor,
      boxshadowColor: boxshadowColor ?? this.boxshadowColor,
      tabBarUnselectedFillColor:
          tabBarUnselectedFillColor ?? this.tabBarUnselectedFillColor,
      tabBarSelectedFillColor:
          tabBarSelectedFillColor ?? this.tabBarSelectedFillColor,
      thirdBackgroundColor: thirdBackgroundColor ?? this.thirdBackgroundColor,
      decentLabelColor: decentLabelColor ?? this.decentLabelColor,
      contrastBorderColor: contrastBorderColor ?? this.contrastBorderColor,
      secondaryOverlayElementBackgroundColor:
          secondaryOverlayElementBackgroundColor ??
              this.secondaryOverlayElementBackgroundColor,
      discoverPageOverlayColorOne:
          discoverPageOverlayColorOne ?? this.discoverPageOverlayColorOne,
      discoverPageOverlayColorTwo:
          discoverPageOverlayColorTwo ?? this.discoverPageOverlayColorTwo,
      backButtonBackgroundColor:
          backButtonBackgroundColor ?? this.backButtonBackgroundColor,
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
      favoritesIconColor:
          Color.lerp(favoritesIconColor, other.favoritesIconColor, t),
      overlayElementBackgroundColor: Color.lerp(overlayElementBackgroundColor,
          other.overlayElementBackgroundColor, t),
      boxshadowColor: Color.lerp(boxshadowColor, other.boxshadowColor, t),
      tabBarUnselectedFillColor: Color.lerp(
          tabBarUnselectedFillColor, other.tabBarUnselectedFillColor, t),
      tabBarSelectedFillColor:
          Color.lerp(tabBarSelectedFillColor, other.tabBarSelectedFillColor, t),
      thirdBackgroundColor:
          Color.lerp(thirdBackgroundColor, other.thirdBackgroundColor, t),
      decentLabelColor: Color.lerp(decentLabelColor, other.decentLabelColor, t),
      contrastBorderColor:
          Color.lerp(contrastBorderColor, other.contrastBorderColor, t),
      secondaryOverlayElementBackgroundColor: Color.lerp(
          secondaryOverlayElementBackgroundColor,
          other.secondaryOverlayElementBackgroundColor,
          t),
      discoverPageOverlayColorOne: Color.lerp(
          discoverPageOverlayColorOne, other.discoverPageOverlayColorOne, t),
      discoverPageOverlayColorTwo: Color.lerp(
          discoverPageOverlayColorTwo, other.discoverPageOverlayColorTwo, t),
      backButtonBackgroundColor: Color.lerp(
          backButtonBackgroundColor, other.backButtonBackgroundColor, t),
    );
  }
}
