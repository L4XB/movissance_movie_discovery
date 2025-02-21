import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/add_to_favouries_action_button.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details_content.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Scaffold(
      backgroundColor: themeExtension?.mainBackGroundColor,
      body: MovieDetailsContent(),
      floatingActionButton: AddToFavouriesActionButton(),
    );
  }
}
