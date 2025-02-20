import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_filter_cubit/favourites_filter_cubit.dart';
import 'package:red_line/src/features/favorites/presentation/widgets/favourites_search_filter_bottom_sheet.dart';

class FavouritesSearchFieldWidget extends StatefulWidget {
  const FavouritesSearchFieldWidget({super.key});

  @override
  State<FavouritesSearchFieldWidget> createState() =>
      _FavouritesSearchFieldWidgetState();
}

class _FavouritesSearchFieldWidgetState
    extends State<FavouritesSearchFieldWidget> {
  late final TextEditingController _searchController;

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
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045, vertical: size.height * 0.012),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
          prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                context.read<FavouritesDataCubit>().search(
                    _searchController.text,
                    context.read<FavouritesFilterCubit>().state);
              }),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.tune),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        const FavouritesSearchFilterBottomSheet(),
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
