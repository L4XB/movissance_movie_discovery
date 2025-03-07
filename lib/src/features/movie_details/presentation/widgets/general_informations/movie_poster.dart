import 'package:flutter/cupertino.dart';
import 'package:red_line/src/common/config/config.dart';

class MoviePoster extends StatelessWidget {
  final String backdropPath;

  const MoviePoster({super.key, required this.backdropPath});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;

    /// ----------------- Widget ----------------- ///
    return Container(
      height: size.height * 0.294,
      width: double.infinity,
      decoration: BoxDecoration(
        image: backdropPath != ""
            ? DecorationImage(
                image: NetworkImage(
                    theMovieDatabaseApiImageBaseURL + backdropPath),
                fit: BoxFit.fill,
              )
            : null,
      ),
    );
  }
}
