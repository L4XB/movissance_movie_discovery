import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class SnackBars {
  static void showErrorSnackbar(String message, BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    final scaler = MediaQuery.of(context).textScaler;
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: scaler.scale(16),
        ),
      ),
      backgroundColor: themeExtension?.warningColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
