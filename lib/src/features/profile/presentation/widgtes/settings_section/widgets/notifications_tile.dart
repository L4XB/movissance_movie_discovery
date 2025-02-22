import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/profile/cubit/profile_cubit.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({
    super.key,
    required this.size,
    required this.textScaler,
    required this.themeExtension,
    required this.isNotificationsEnabled,
  });

  final Size size;
  final TextScaler textScaler;
  final CustomThemeColorsExtension? themeExtension;
  final bool isNotificationsEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
      child: ListTile(
        title: Text("Notifications",
            style: TextStyle(
                color: themeExtension?.mainTextColor,
                fontSize: textScaler.scale(15),
                fontWeight: FontWeight.bold)),
        trailing: Switch(
          activeColor: themeExtension?.secondaryColor,
          value: isNotificationsEnabled,
          onChanged: (value) {
            context.read<ProfileCubit>().updateNotificationsEnabled(value);
          },
        ),
      ),
    );
  }
}
