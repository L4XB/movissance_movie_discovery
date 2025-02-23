import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/cubit/connectivity_cubit.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/common/widgets/connection_problems_screen.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/account_bar.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section/settings_section.dart';

class ProfileScreen extends StatelessWidget {
  final AuthRepository authRepository;
  final PersistentTabController controller;
  const ProfileScreen(
      {super.key, required this.authRepository, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityDisconnected) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => ConnectionProblemsScreen(
                      controller: controller,
                    )),
          );
        }
      },
      child: Scaffold(
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
              controller: controller,
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
      ),
    );
  }
}
