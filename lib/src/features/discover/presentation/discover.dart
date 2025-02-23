import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/cubit/connectivity_cubit.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/widgets/connection_problems_screen.dart';
import 'package:red_line/src/features/discover/presentation/widgets/discover_page_content.dart';
import 'package:red_line/src/features/discover/presentation/widgets/swiper_favourit_foating_action_button.dart';

class DiscoverScreen extends StatelessWidget {
  final PersistentTabController controller;
  const DiscoverScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityDisconnected) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => ConnectionProblemsScreen(
                      controller: controller,
                    )),
          );
        }
      },
      child: Scaffold(
        backgroundColor: themeExtension?.mainBackGroundColor,
        body: DiscoverPageContent(
          controller: controller,
        ),
        floatingActionButton: SwiperFavouritFoatingActionButton(),
      ),
    );
  }
}
