import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class DiscoverMoreButton extends StatelessWidget {
  final PersistentTabController controller;
  const DiscoverMoreButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return CupertinoButton(
      sizeStyle: CupertinoButtonSize.medium,
      color: themeExtension?.buttonBackgroundColor,
      onPressed: () {
        controller.jumpToTab(2);
      },
      child: Text(
        "Discover More",
        style: TextStyle(
            color: themeExtension?.secondaryColor,
            fontSize: scaler.scale(14),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
