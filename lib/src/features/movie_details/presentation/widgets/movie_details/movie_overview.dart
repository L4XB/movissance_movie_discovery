import 'package:flutter/cupertino.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_details_sections/widgets/movie_status_badge.dart';

class MovieOverview extends StatelessWidget {
  final String overview;
  final String status;
  final String tagline;

  const MovieOverview(
      {super.key,
      required this.overview,
      required this.status,
      required this.tagline});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Tagline: $tagline",
            style: TextStyle(
                fontSize: 14,
                color: CupertinoColors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBoxExtension.height(15),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MovieStatusBadge(status: status)),
        SizedBoxExtension.height(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            overview,
            style: TextStyle(
              fontSize: 14,
              color: CupertinoColors.black,
            ),
          ),
        ),
        SizedBoxExtension.height(20),
      ],
    );
  }
}
