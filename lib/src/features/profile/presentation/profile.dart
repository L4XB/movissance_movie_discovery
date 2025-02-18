import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/account_bar.dart';
import 'package:red_line/src/features/profile/presentation/widgtes/settings_section.dart';

class ProfileScreen extends StatelessWidget {
  final AuthRepository authRepository;
  const ProfileScreen({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, top: 70),
            child: Text("Account",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 53, 65, 93))),
          ),
          SizedBoxExtension.height(20),
          AccountBar(
            authRepository: authRepository,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 35),
            child: Text("Settings",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 53, 65, 93))),
          ),
          SizedBoxExtension.height(20),
          SettingsSection(),
        ],
      ),
    );
  }
}
