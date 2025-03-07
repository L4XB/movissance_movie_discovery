import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class DividerTile extends StatelessWidget {
  const DividerTile({
    super.key,
    required this.size,
    required this.themeExtension,
  });

  final Size size;
  final CustomThemeColorsExtension? themeExtension;

  @override
  Widget build(BuildContext context) {
    /// ----------------- Widget ----------------- ///
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
      child: Divider(
        height: 1,
        thickness: 1.5,
        color: themeExtension?.inputFieldBorderColor,
      ),
    );
  }
}
