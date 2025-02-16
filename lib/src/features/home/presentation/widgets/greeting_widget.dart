import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';

class GreetingWidget extends StatelessWidget {
  final PersistentTabController controller;
  const GreetingWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hallo, Lukas 👋",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBoxExtension.height(5),
              Text(
                "Explore the World of Movies",
                style: TextStyle(color: const Color.fromARGB(169, 0, 0, 0)),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              controller.jumpToTab(3);
            },
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
            ),
          ),
        )
      ],
    );
  }
}
