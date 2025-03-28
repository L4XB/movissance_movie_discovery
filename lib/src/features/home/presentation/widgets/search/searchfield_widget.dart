import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/search/filter_bottom_sheet.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({super.key});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  /// ----------------- State Variables and methods ----------------- ///
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045, vertical: size.height * 0.012),
      child: TextFormField(
        style: TextStyle(color: themeExtension?.mainTextColor),
        cursorColor: themeExtension?.mainTextColor,
        controller: _searchController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: themeExtension?.mainTextColor as Color),
          ),
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: themeExtension?.inputFieldBorderColor as Color),
          ),
          filled: true,
          fillColor: themeExtension?.inputFieldFillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
          prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: themeExtension?.mainIconColor,
              ),
              onPressed: () {
                context.read<HomeMovieCubit>().loadMoviesBySearch(
                      _searchController.text,
                      1,
                    );
              }),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.tune,
                  color: themeExtension?.mainIconColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const FilterBottomSheet(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
