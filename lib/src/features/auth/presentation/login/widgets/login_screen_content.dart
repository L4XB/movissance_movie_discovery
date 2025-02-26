import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/utils/firebase_error_text_converter.dart';
import 'package:red_line/src/common/utils/snack_bars.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/background_circles.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/email_text_field.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/password_text_field.dart';
import 'package:red_line/src/features/auth/presentation/password_reset/password_reset.dart';

class LoginScreenContent extends StatefulWidget {
  final AuthRepository authRepository;
  const LoginScreenContent({
    super.key,
    required this.authRepository,
  });

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Stack(
      children: [
        const BackgroundCircles(),
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.123),
                  Center(
                    child: Lottie.asset(
                        'assets/animations/login_animation.json',
                        height: size.height * 0.29),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.053),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign in into your\nAccount',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: scaler.scale(27),
                          fontWeight: FontWeight.bold,
                          color: themeExtension?.mainTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  EmailTextField(
                    controller: _emailController,
                  ),
                  PasswordTextField(
                    controller: _passwordController,
                    label: "Password",
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await widget.authRepository.loginUser(
                            _emailController.text,
                            _passwordController.text,
                          );
                        } catch (e) {
                          if (context.mounted) {
                            final errorText =
                                FirebaseErrorTextConverter.convertFirebaseError(
                                    e.toString());
                            SnackBars.showErrorSnackbar(errorText, context);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: themeExtension?.contrastTextColor,
                        backgroundColor: themeExtension?.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.14,
                            vertical: size.height * 0.015),
                      ),
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: scaler.scale(15),
                              color: themeExtension?.contrastTextColor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PasswordResetScreen(
                                authRepository: widget.authRepository,
                              )));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: themeExtension?.primaryColor),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: size.height * 0.086,
                    width: size.width * 0.285,
                    decoration: BoxDecoration(
                      color: themeExtension?.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: themeExtension?.contrastTextColor,
                            fontSize: scaler.scale(17),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
