import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/password_reset/password_reset.dart';

class ResetPasswordTile extends StatelessWidget {
  const ResetPasswordTile({
    super.key,
    required this.size,
    required this.textScaler,
    required this.themeExtension,
    required this.authRepository,
  });

  final Size size;
  final TextScaler textScaler;
  final CustomThemeColorsExtension? themeExtension;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    /// ----------------- Widget ----------------- ///
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.0055),
      child: GestureDetector(
        onTap: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: PasswordResetScreen(
              authRepository: authRepository,
            ),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: ListTile(
          title: Text("Reset Password",
              style: TextStyle(
                  color: themeExtension?.mainTextColor,
                  fontSize: textScaler.scale(15),
                  fontWeight: FontWeight.bold)),
          trailing: Padding(
            padding: EdgeInsets.only(right: size.width * 0.025),
            child: Icon(
              Icons.arrow_forward_ios,
              color: themeExtension?.mainIconColor,
              size: textScaler.scale(18),
            ),
          ),
        ),
      ),
    );
  }
}
