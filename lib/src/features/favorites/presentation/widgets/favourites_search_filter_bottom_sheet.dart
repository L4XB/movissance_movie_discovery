import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_filter_cubit/favourites_filter_cubit.dart';
import 'package:red_line/src/features/home/presentation/widgets/search/custom_radio_list_tile.dart';

class FavouritesSearchFilterBottomSheet extends StatelessWidget {
  const FavouritesSearchFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesFilterCubit, int>(
      builder: (context, selectedValue) {
        return Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        "Duration",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 53, 65, 93),
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
