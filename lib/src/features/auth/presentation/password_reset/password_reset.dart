import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/utils/firebase_error_text_converter.dart';
import 'package:red_line/src/common/utils/snack_bars.dart';
import 'package:red_line/src/common/widgets/back_button.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';

class PasswordResetScreen extends StatefulWidget {
  final AuthRepository authRepository;
  const PasswordResetScreen({super.key, required this.authRepository});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  /// ----------------- State Variables and Methods ----------------- ///
  late final TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void resetPassword(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        await widget.authRepository.resetPassword(emailController.text);
        if (context.mounted) {
          Navigator.pop(context);
        }
        if (context.mounted) {
          SnackBars.showStatusSnackBar(
              'Password reset link has been sent to your email', context);
        }
      }
    } catch (e) {
      final errorText =
          FirebaseErrorTextConverter.convertFirebaseError(e.toString());
      if (context.mounted) {
        SnackBars.showStatusSnackBar(errorText, context, isWarning: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return Scaffold(
      backgroundColor: themeExtension?.mainBackGroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.086),
            child: Align(
                alignment: Alignment.centerLeft, child: CustomBackButton()),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.053),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.053),
                      child: Text(
                        "Please enter your email address to reset your password.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: scaler.scale(16),
                            color: themeExtension?.secondaryLabelColor),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    Form(
                      key: formKey,
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: themeExtension?.mainTextColor),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        cursorColor: themeExtension?.mainTextColor,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: themeExtension?.mainTextColor as Color),
                          ),
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: themeExtension?.mainTextColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: themeExtension?.inputFieldFillColor,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.053),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => resetPassword(context),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: themeExtension?.contrastTextColor,
                          backgroundColor: themeExtension?.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.133,
                              vertical: size.height * 0.018),
                        ),
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                              color: themeExtension?.contrastBorderColor,
                              fontSize: scaler.scale(15),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
