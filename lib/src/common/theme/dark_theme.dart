import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

final darkTheme = ThemeData(
  extensions: [
    /// make use of the custom theme colors extension
    CustomThemeColorsExtension(
      mainBackGroundColor: Color.fromARGB(255, 18, 18, 18),
      primaryColor: Colors.blueAccent,
      secondaryColor: CupertinoColors.systemBlue,
      secondaryLabelColor: Color.fromARGB(169, 255, 255, 255),
      mainTextColor: Colors.white,
      buttonBackgroundColor: Color.fromARGB(41, 0, 123, 255),
      inputFieldBorderColor: Colors.grey,
      inputFieldFillColor: Color.fromARGB(255, 28, 28, 30),
      mainIconColor: Color.fromARGB(255, 200, 200, 200),
      secondaryBackgroundColor: CupertinoColors.darkBackgroundGray,
      headLineTextColor: Color.fromARGB(255, 200, 200, 200),
      starIconColor: Color.fromARGB(255, 228, 214, 90),
      cardColor: Color.fromARGB(255, 34, 34, 34),
      contrastTextColor: Colors.black,
      favoritesIconColor: CupertinoColors.systemYellow,
      overlayElementBackgroundColor: CupertinoColors.systemGrey,
      boxshadowColor: Color.fromARGB(25, 8, 64, 88),
      tabBarUnselectedFillColor: Color.fromARGB(255, 50, 50, 50),
      tabBarSelectedFillColor: Color.fromARGB(255, 34, 34, 34),
      thirdBackgroundColor: CupertinoColors.darkBackgroundGray,
      decentLabelColor: CupertinoColors.systemGrey,
      contrastBorderColor: Colors.black,
      secondaryOverlayElementBackgroundColor: Color.fromARGB(255, 43, 43, 49),
      discoverPageOverlayColorOne: Colors.black.withAlpha(204),
      discoverPageOverlayColorTwo: Colors.black.withAlpha(51),
      backButtonBackgroundColor: Color.fromARGB(177, 50, 50, 50),
      warningColor: Colors.red,
    ),
  ],
);
