import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pop(context);
      },
      child: Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(177, 189, 190, 191),
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
              color: Color.fromARGB(255, 67, 144, 226),
            ),
          ),
        ),
      ),
    );
  }
}
