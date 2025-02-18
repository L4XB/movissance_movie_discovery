import 'package:flutter/material.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/signup/widgets/sign_up_creen_content.dart';

class SignupScreen extends StatelessWidget {
  final AuthRepository authRepository;
  const SignupScreen({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SignUpCreenContent(
          authRepository: authRepository,
        ));
  }
}
