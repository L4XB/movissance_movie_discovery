import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/auth/cubit/user_data_cubit.dart';

class GreetingWidget extends StatelessWidget {
  final PersistentTabController controller;
  const GreetingWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return BlocProvider(
      create: (context) => UserDataCubit(),
      child: BlocBuilder<UserDataCubit, User?>(
        builder: (context, state) {
          final currentUser = state;
          final displayName = currentUser?.displayName ?? "";
          final imagePath = currentUser?.photoURL;
          final imageFile = imagePath != null ? File(imagePath) : null;
          final imageExists = imageFile?.existsSync() ?? false;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello, $displayName 👋",
                      style: TextStyle(
                        fontSize: scaler.scale(27),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBoxExtension.height(size.height * 0.0055),
                    Text(
                      "Explore the World of Movies",
                      style:
                          TextStyle(color: const Color.fromARGB(169, 0, 0, 0)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.05),
                child: GestureDetector(
                  onTap: () {
                    controller.jumpToTab(3);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: imageExists
                        ? FileImage(imageFile!)
                        : AssetImage("assets/images/placeholder.png"),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
