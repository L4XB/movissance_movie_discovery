import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/common/widgets/back_button.dart';
import 'package:red_line/src/features/movie_details/bloc/detials_selection_cubit/details_selection_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/overlay_image.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations_and_poster.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_details_sections/about_movie_section.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_details_sections/movie_provider_section.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_details_sections/movie_review_section.dart';

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            GeneralInformationsAndPoster(),
            OverlayImage(),
            Positioned(
              top: size.height * 0.07,
              child: CustomBackButton(),
            ),
          ],
        ),
        SizedBoxExtension.height(size.height * 0.0225),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: themeExtension?.thirdBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: themeExtension?.boxshadowColor as Color,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, -2)),
              ],
            ),
            child: Column(
              children: [
                SizedBoxExtension.height(size.height * 0.0225),
                SegmentedButton(
                  segments: [
                    ButtonSegment(
                      value: 0,
                      label: Text(
                        'About',
                        style: TextStyle(color: themeExtension?.mainTextColor),
                      ),
                    ),
                    ButtonSegment<int>(
                      value: 1,
                      label: Text(
                        'Providers',
                        style: TextStyle(color: themeExtension?.mainTextColor),
                      ),
                    ),
                    ButtonSegment<int>(
                        value: 2,
                        label: Text(
                          'Reviews',
                          style:
                              TextStyle(color: themeExtension?.mainTextColor),
                        )),
                  ],
                  onSelectionChanged: (Set<int> newSelection) {
                    context.read<DetailsSelectionCubit>().setDetailsSelection(
                          newSelection.first,
                        );
                  },
                  showSelectedIcon: false,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return themeExtension?.tabBarSelectedFillColor;
                        }
                        return themeExtension?.tabBarUnselectedFillColor;
                      },
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  selected: context
                      .select((DetailsSelectionCubit cubit) => cubit.state == 0
                          ? {0}
                          : cubit.state == 1
                              ? {1}
                              : {2}),
                ),
                SizedBoxExtension.height(size.height * 0.0225),
                Expanded(
                  child: BlocBuilder<DetailsSelectionCubit, int>(
                    builder: (context, state) {
                      if (state == 0) {
                        return AboutMovieSection();
                      }
                      if (state == 1) {
                        return MovieProviderSection();
                      }
                      if (state == 2) {
                        return MovieReviewSection();
                      }
                      return Text('Unknown state');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
