import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/discover/presentation/widgets/discover_page_content.dart';
import 'package:red_line/src/features/discover/presentation/widgets/swiper_favourit_foating_action_button.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Scaffold(
      backgroundColor: themeExtension?.mainBackGroundColor,
      body: DiscoverPageContent(),
      floatingActionButton: SwiperFavouritFoatingActionButton(),
    );
  }
}
