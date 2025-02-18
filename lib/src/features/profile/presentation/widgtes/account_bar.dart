import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/auth/cubit/user_data_cubit.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';

class AccountBar extends StatelessWidget {
  final AuthRepository authRepository;
  const AccountBar({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentUser = context.read<UserDataCubit>().state;
    final displayName = currentUser?.displayName ?? "";
    final imagePath = currentUser?.photoURL;
    return Center(
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width * 0.90,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: imagePath == null
                      ? NetworkImage(
                          "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250")
                      : FileImage(File(imagePath)),
                ),
                SizedBoxExtension.width(20),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Welcome, ",
                        style: TextStyle(
                            fontSize: 18,
                            color: CupertinoColors.secondaryLabel),
                      ),
                      Text(
                        displayName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(232, 46, 46, 48),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          authRepository.logoutUser();
                        },
                        child: Icon(CupertinoIcons.square_arrow_right,
                            color: Color.fromARGB(255, 53, 65, 93),
                            weight: 30,
                            size: 25),
                      ),
                      SizedBoxExtension.width(10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
