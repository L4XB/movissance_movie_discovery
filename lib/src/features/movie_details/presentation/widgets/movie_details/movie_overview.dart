import 'package:flutter/cupertino.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
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
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
          child: Text(
            "Tagline: $tagline",
            style: TextStyle(
                fontSize: scaler.scale(14),
                color: CupertinoColors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBoxExtension.height(size.height * 0.018),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
            child: MovieStatusBadge(status: status)),
        SizedBoxExtension.height(size.height * 0.018),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
          child: Text(
            overview,
            style: TextStyle(
              fontSize: scaler.scale(14),
              color: CupertinoColors.black,
            ),
          ),
        ),
        SizedBoxExtension.height(size.height * 0.019),
      ],
    );
  }
}
