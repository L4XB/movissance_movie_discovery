import 'package:flutter/material.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({super.key});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;

    /// ----------------- Widget ----------------- ///
    return Stack(
      children: [
        Positioned(
          top: -30,
          left: -50,
          child: Container(
            width: size.width * 0.51,
            height: size.width * 0.51,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withAlpha(80),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: -50,
          top: -60,
          child: Container(
            width: size.width * 0.51,
            height: size.width * 0.51,
            decoration: BoxDecoration(
              color: Colors.pinkAccent.withAlpha(80),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: -100,
          child: Container(
            width: size.width * 0.375,
            height: size.width * 0.375,
            decoration: BoxDecoration(
              color: Colors.greenAccent.withAlpha(70),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
