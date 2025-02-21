import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

final lightTheme = ThemeData(extensions: [
  CustomThemeColorsExtension(
    mainBackGroundColor: Color.fromARGB(255, 253, 247, 254),
    primaryColor: Colors.blueAccent,
    secondaryColor: CupertinoColors.systemBlue,
    secondaryLabelColor: Color.fromARGB(169, 0, 0, 0),
    mainTextColor: Colors.black,
    buttonBackgroundColor: Color.fromARGB(41, 0, 123, 255),
    inputFieldBorderColor: Colors.grey,
    inputFieldFillColor: Colors.white,
    mainIconColor: Color.fromARGB(255, 87, 84, 93),
    secondaryBackgroundColor: CupertinoColors.systemBackground,
    headLineTextColor: Color.fromARGB(255, 53, 65, 93),
    starIconColor: Color.fromARGB(255, 228, 214, 90),
    cardColor: Color.fromARGB(255, 246, 242, 250),
    contrastTextColor: Colors.white,
    favoritesIconColor: CupertinoColors.systemYellow,
    overlayElementBackgroundColor: CupertinoColors.systemGrey5,
    boxshadowColor: Color.fromARGB(25, 8, 64, 88),
    tabBarUnselectedFillColor: Color.fromARGB(255, 235, 235, 251),
    tabBarSelectedFillColor: Colors.white,
    thirdBackgroundColor: CupertinoColors.secondarySystemBackground,
    decentLabelColor: CupertinoColors.systemGrey,
    contrastBorderColor: Colors.white,
    secondaryOverlayElementBackgroundColor: CupertinoColors.systemGrey6,
  ),
]);
