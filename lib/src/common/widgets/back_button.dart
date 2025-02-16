import 'package:flutter/cupertino.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(178, 248, 249, 250),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(
            CupertinoIcons.chevron_back,
            weight: 70,
            size: 26,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
    );
  }
}
