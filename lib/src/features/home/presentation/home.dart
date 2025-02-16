import 'package:flutter/material.dart';
import 'package:red_line/src/features/home/presentation/widgets/home_screen_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey.shade900,
        body: HomeScreenContent());
  }
}
