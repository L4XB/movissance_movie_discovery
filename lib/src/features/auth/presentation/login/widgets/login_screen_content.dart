import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    return Stack(
      children: [
        const BackgroundCircles(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Lottie.asset('assets/animations/login_animation.json',
                  height: 250),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Sign in into your\nAccount',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            EmailTextField(
              controller: _emailController,
            ),
            PasswordTextField(
              controller: _passwordController,
              label: "Password",
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  try {
                    widget.authRepository.loginUser(
                      _emailController.text,
                      _passwordController.text,
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Login',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PasswordResetScreen(
                          authRepository: widget.authRepository,
                        )));
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            const Spacer(),
            Container(
              height: 70,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
