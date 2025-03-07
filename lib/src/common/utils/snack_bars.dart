import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class SnackBars {
  /// show a error snackbar
  /// [message] the message to be displayed
  /// [context] the context to show the snackbar
  static void showStatusSnackBar(String message, BuildContext context,
      {bool isWarning = false}) {
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
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: isWarning
          ? themeExtension?.warningColor
          : themeExtension?.successColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
