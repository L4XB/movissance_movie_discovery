import 'package:flutter/material.dart';
import 'package:red_line/src/common/widgets/back_button.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70),
            child: CustomBackButton(),
          )
        ],
      ),
    );
  }
}
