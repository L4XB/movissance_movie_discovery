import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/login_screen_content.dart';
import 'package:red_line/src/features/auth/presentation/signup/signup.dart';

class LoginScreen extends StatelessWidget {
  final AuthRepository authRepository;
  const LoginScreen({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    final PageController pageController = PageController();
    return Scaffold(
      backgroundColor: themeExtension?.mainBackGroundColor,
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          LoginScreenContent(
              authRepository: authRepository, pageController: pageController),
          SignupScreen(
            authRepository: authRepository,
            controller: pageController,
          ),
        ],
      ),
    );
  }
}
