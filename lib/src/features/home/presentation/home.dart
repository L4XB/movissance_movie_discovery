import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/home/presentation/widgets/home_screen_content.dart';

class HomeScreen extends StatelessWidget {
  final PersistentTabController controller;
  final AuthRepository authRepository;
  const HomeScreen(
      {super.key, required this.controller, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey.shade900,
        body: HomeScreenContent(
      controller: controller,
      authRepository: authRepository,
    ));
  }
}
