import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class MovieTitle extends StatelessWidget {
  final String title;

  const MovieTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150, top: 10, right: 10),
      child: AutoSizeText(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        minFontSize: 12,
        overflow: TextOverflow.ellipsis,
        wrapWords: true,
      ),
    );
  }
}
