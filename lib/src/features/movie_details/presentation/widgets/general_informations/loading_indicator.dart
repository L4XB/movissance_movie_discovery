import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.4),
      child: Center(
        child: CircularProgressIndicator(
          color: themeExtension?.primaryColor,
        ),
      ),
    );
  }
}
