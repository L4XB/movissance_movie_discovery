import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/favorites/presentation/favourites_content.dart';
import 'package:red_line/src/features/favorites/presentation/widgets/favourites_search_field_widget.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Scaffold(
      backgroundColor: themeExtension?.mainBackGroundColor,
      body: Column(
        children: [
          SizedBoxExtension.height(size.height * 0.0705),
          FavouritesSearchFieldWidget(),
          FavouritesContent()
        ],
      ),
    );
  }
}
