import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';

class AccountBar extends StatelessWidget {
  const AccountBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width * 0.90,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 226, 226),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
                ),
                SizedBoxExtension.width(20),
                Row(
                  children: [
                    Text(
                      "Welcome, ",
                      style: TextStyle(
                          fontSize: 18, color: CupertinoColors.secondaryLabel),
                    ),
                    Text(
                      "Lukas",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(232, 46, 46, 48),
                      ),
                    ),
                    SizedBoxExtension.width(60),
                    Icon(CupertinoIcons.square_arrow_right,
                        color: Color.fromARGB(255, 53, 65, 93),
                        weight: 30,
                        size: 25)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
