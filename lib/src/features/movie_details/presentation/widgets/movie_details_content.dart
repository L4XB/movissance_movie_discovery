import 'package:flutter/material.dart';
import 'package:red_line/src/common/widgets/back_button.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/general_informations_and_poster.dart';

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GeneralInformationsAndPoster(),
            Positioned(
              top: 55,
              child: CustomBackButton(),
            ),
          ],
        ),
      ],
    );
  }
}
