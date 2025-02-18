import 'package:flutter/material.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -30,
          left: -50,
          child: Container(
            width: 200,
            height: 200,
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
            width: 200,
            height: 200,
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
            width: 150,
            height: 150,
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
