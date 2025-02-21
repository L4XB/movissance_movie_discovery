import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scaler = MediaQuery.of(context).textScaler;
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pop(context);
      },
      child: Container(
        height: size.height * 0.036,
        width: size.width * 0.1275,
        decoration: BoxDecoration(
          color: themeExtension?.backButtonBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(right: size.width * 0.0175),
            child: Icon(
              CupertinoIcons.chevron_back,
              weight: 70,
              size: scaler.scale(26),
              color: themeExtension?.secondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
