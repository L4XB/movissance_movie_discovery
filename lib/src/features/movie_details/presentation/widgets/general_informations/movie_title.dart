import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class MovieTitle extends StatelessWidget {
  final String title;

  const MovieTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.382,
        top: size.height * 0.011,
      ),
      child: AutoSizeText(
        title,
        style: TextStyle(
          fontSize: scaler.scale(20),
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
