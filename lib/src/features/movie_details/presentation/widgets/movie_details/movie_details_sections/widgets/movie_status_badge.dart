import 'package:flutter/material.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class MovieStatusBadge extends StatelessWidget {
  final String status;

  const MovieStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: statusColor[status] ??
              themeExtension?.overlayElementBackgroundColor),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.025, vertical: size.height * 0.003),
        child: Text(
          status,
          style: TextStyle(
            fontSize: scaler.scale(15),
            fontWeight: FontWeight.bold,
            color: themeExtension?.contrastTextColor,
          ),
        ),
      ),
    );
  }
}
