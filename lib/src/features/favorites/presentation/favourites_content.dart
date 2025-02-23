import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';
import 'package:red_line/src/features/favorites/presentation/widgets/favourits_element.dart';

class FavouritesContent extends StatelessWidget {
  const FavouritesContent({
    super.key,
    required this.controller,
  });

  final PersistentTabController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return BlocBuilder<FavouritesDataCubit, FavouritesDataState>(
      builder: (context, state) {
        if (state is FavouritesDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FavouritesDataLoaded) {
          if (state.movies.isEmpty) {
            return Center(
              child: Text(
                "No favourites found.",
                style: TextStyle(color: themeExtension?.mainTextColor),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: size.height * 0.0125),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return FavouritsElement(movie: movie, controller: controller);
              },
            ),
          );
        }
        return Text("Unknown state",
            style: TextStyle(color: themeExtension?.mainTextColor));
      },
    );
  }
}
