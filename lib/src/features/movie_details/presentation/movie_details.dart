import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/cubit/connectivity_cubit.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/widgets/connection_problems_screen.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/add_to_favouries_action_button.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details_content.dart';

class MovieDetails extends StatelessWidget {
  final PersistentTabController controller;
  const MovieDetails({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
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
        body: MovieDetailsContent(),
        floatingActionButton: AddToFavouriesActionButton(),
      ),
    );
  }
}
