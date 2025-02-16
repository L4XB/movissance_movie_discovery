import 'package:flutter/material.dart';
import 'package:red_line/src/common/widgets/back_button.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/general_informations_and_poster.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/overlay_image.dart';

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            GeneralInformationsAndPoster(),
            OverlayImage(),
            Positioned(
              top: 55,
              child: CustomBackButton(),
            ),
          ],
        ),
        SizedBoxExtension.height(40),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 235, 235),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 8, 64, 88).withAlpha(51),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, -3), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
