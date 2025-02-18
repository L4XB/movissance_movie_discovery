import 'package:flutter/material.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/login_screen_content.dart';
import 'package:red_line/src/features/auth/presentation/signup/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          LoginScreenContent(),
          SignupScreen(),
        ],
      ),
    );
  }
}
