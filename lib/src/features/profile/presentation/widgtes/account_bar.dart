import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/common/services/cubit_reset_service.dart';
import 'package:red_line/src/features/auth/cubit/user_data_cubit.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';

class AccountBar extends StatelessWidget {
  final AuthRepository authRepository;
  final PersistentTabController controller;
  const AccountBar(
      {super.key, required this.authRepository, required this.controller});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;

    /// ----------------- Widget ----------------- ///
    return BlocProvider(
      create: (context) => UserDataCubit(),
      child: BlocBuilder<UserDataCubit, User?>(
        builder: (context, state) {
          /// ----------------- Local Cubit Variables ----------------- ///
          final currentUser = state;
          final displayName = currentUser?.displayName ?? "";
          final imagePath = currentUser?.photoURL;
          final imageFile = imagePath != null ? File(imagePath) : null;
          final imageExists = imageFile?.existsSync() ?? false;
          final themeExtension =
              Theme.of(context).extension<CustomThemeColorsExtension>();

          /// ----------------- Widget ----------------- ///
          return Center(
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: size.width * 0.90,
                decoration: BoxDecoration(
                  color: themeExtension?.secondaryOverlayElementBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: imageExists
                            ? FileImage(imageFile!)
                            : AssetImage("assets/images/placeholder.png"),
                      ),
                      SizedBoxExtension.width(size.width * 0.050),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Welcome, ",
                              style: TextStyle(
                                  fontSize: textScaler.scale(18),
                                  color: themeExtension?.decentLabelColor),
                            ),
                            Text(
                              displayName,
                              style: TextStyle(
                                fontSize: textScaler.scale(20),
                                fontWeight: FontWeight.bold,
                                color: themeExtension?.mainTextColor,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () async {
                                await authRepository.logoutUser();
                                if (context.mounted) {
                                  CubitResetService.resetCubits(context);
                                  controller.jumpToTab(0);
                                }
                              },
                              child: Icon(CupertinoIcons.square_arrow_right,
                                  color: themeExtension?.mainIconColor,
                                  weight: 30,
                                  size: textScaler.scale(25)),
                            ),
                            SizedBoxExtension.width(size.width * 0.025),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
