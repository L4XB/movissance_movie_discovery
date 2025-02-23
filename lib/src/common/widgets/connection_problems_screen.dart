import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/cubit/connectivity_cubit.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/home/presentation/home.dart';

class ConnectionProblemsScreen extends StatelessWidget {
  final PersistentTabController controller;
  const ConnectionProblemsScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityConnected) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                controller: controller,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: themeExtension?.mainBackGroundColor,
        body: Center(
          child: Lottie.asset(
            "assets/animations/no_connection.json",
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
