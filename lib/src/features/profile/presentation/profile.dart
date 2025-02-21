import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/account_bar.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section.dart';

class ProfileScreen extends StatelessWidget {
  final AuthRepository authRepository;
  const ProfileScreen({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Scaffold(
      backgroundColor: themeExtension?.mainBackGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.065, top: size.height * 0.0825),
            child: Text("Account",
                style: TextStyle(
                    fontSize: textScaler.scale(25),
                    fontWeight: FontWeight.bold,
                    color: themeExtension?.headLineTextColor)),
          ),
          SizedBoxExtension.height(size.height * 0.025),
          AccountBar(
            authRepository: authRepository,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.065, top: size.height * 0.045),
            child: Text("Settings",
                style: TextStyle(
                    fontSize: textScaler.scale(25),
                    fontWeight: FontWeight.bold,
                    color: themeExtension?.headLineTextColor)),
          ),
          SizedBoxExtension.height(size.height * 0.025),
          SettingsSection(
            authRepository: authRepository,
          ),
        ],
      ),
    );
  }
}
