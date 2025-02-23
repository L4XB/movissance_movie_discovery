import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/cubit/connectivity_cubit.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/common/widgets/connection_problems_screen.dart';
import 'package:red_line/src/features/favorites/presentation/favourites_content.dart';
import 'package:red_line/src/features/favorites/presentation/widgets/favourites_search_field_widget.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key, required this.controller});

  final PersistentTabController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityDisconnected) {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: ConnectionProblemsScreen(
              controller: controller,
            ),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      },
      child: Scaffold(
        backgroundColor: themeExtension?.mainBackGroundColor,
        body: Column(
          children: [
            SizedBoxExtension.height(size.height * 0.0705),
            FavouritesSearchFieldWidget(),
            FavouritesContent(
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
