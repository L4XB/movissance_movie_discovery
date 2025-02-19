import 'package:flutter/cupertino.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.07, bottom: size.height * 0.01),
      child: Text(
        title,
        style: TextStyle(
          fontSize: scaler.scale(20),
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 53, 65, 93),
        ),
      ),
    );
  }
}
