import 'package:flutter/material.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/login_screen_content.dart';
import 'package:red_line/src/features/auth/presentation/signup/signup.dart';

class LoginScreen extends StatelessWidget {
  final AuthRepository authRepository;
  const LoginScreen({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          LoginScreenContent(
            authRepository: authRepository,
          ),
          SignupScreen(authRepository: authRepository),
        ],
      ),
    );
  }
}
