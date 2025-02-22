import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/profile/cubit/profile_cubit.dart';

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({
    super.key,
    required this.size,
    required this.textScaler,
    required this.themeExtension,
    required this.isDarkMode,
  });

  final Size size;
  final TextScaler textScaler;
  final CustomThemeColorsExtension? themeExtension;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
      child: ListTile(
        title: Text("Dark Mode",
            style: TextStyle(
                color: themeExtension?.mainTextColor,
                fontSize: textScaler.scale(15),
                fontWeight: FontWeight.bold)),
        trailing: Switch(
          value: isDarkMode,
          activeColor: themeExtension?.secondaryColor,
          onChanged: (value) {
            context.read<ProfileCubit>().updateDarkMode(value);
          },
        ),
      ),
    );
  }
}
