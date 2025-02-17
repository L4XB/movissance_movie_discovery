import 'package:flutter/cupertino.dart';
import 'package:red_line/src/config.dart';

class MoviePoster extends StatelessWidget {
  final String backdropPath;

  const MoviePoster({super.key, required this.backdropPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(theMovieDatabaseApiImageBaseURL + backdropPath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
