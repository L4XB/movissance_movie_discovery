import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class DiscoverMoreButton extends StatelessWidget {
  final PersistentTabController controller;
  const DiscoverMoreButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      sizeStyle: CupertinoButtonSize.medium,
      color: const Color.fromARGB(41, 0, 123, 255),
      onPressed: () {
        controller.jumpToTab(1);
      },
      child: Text(
        "Discover More",
        style: TextStyle(
            color: CupertinoColors.systemBlue,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
