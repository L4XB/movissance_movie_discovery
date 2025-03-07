import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_filter_cubit/favourites_filter_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/search/custom_radio_list_tile.dart';

class FavouritesSearchFilterBottomSheet extends StatelessWidget {
  const FavouritesSearchFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return BlocBuilder<FavouritesFilterCubit, int>(
      builder: (context, selectedValue) {
        return Container(
          decoration: BoxDecoration(
            color: themeExtension?.secondaryBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.0375),
                  child: Row(
                    children: [
                      Text(
                        "Duration",
                        style: TextStyle(
                          fontSize: scaler.scale(20),
                          fontWeight: FontWeight.bold,
                          color: themeExtension?.headLineTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomRadioListTile(
                  title: 'Any',
                  value: 1,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    context.read<FavouritesFilterCubit>().setFilter(value!);
                  },
                ),
                CustomRadioListTile(
                  title: 'Short (less than 60 min)',
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    context.read<FavouritesFilterCubit>().setFilter(value!);
                  },
                ),
                CustomRadioListTile(
                  title: 'Medium (1 to 2 hours)',
                  value: 3,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    context.read<FavouritesFilterCubit>().setFilter(value!);
                  },
                ),
                CustomRadioListTile(
                  title: 'Long (more than 2 hours)',
                  value: 4,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    context.read<FavouritesFilterCubit>().setFilter(value!);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
