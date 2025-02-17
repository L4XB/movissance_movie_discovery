import 'package:flutter/material.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/favorites/presentation/widgets/favourites_search_field_widget.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBoxExtension.height(60),
          FavouritesSearchFieldWidget(),
        ],
      ),
    );
  }
}
