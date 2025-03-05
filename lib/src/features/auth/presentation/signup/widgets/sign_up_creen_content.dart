import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/utils/firebase_error_text_converter.dart';
import 'package:red_line/src/common/utils/snack_bars.dart';
import 'package:red_line/src/common/utils/textfield_validators.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/email_text_field.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/password_text_field.dart';
import 'package:red_line/src/features/auth/presentation/signup/widgets/image_picker_field.dart';
import 'package:red_line/src/features/auth/presentation/signup/widgets/name_text_field.dart';

class SignUpCreenContent extends StatefulWidget {
  final AuthRepository authRepository;
  const SignUpCreenContent({super.key, required this.authRepository});

  @override
  State<SignUpCreenContent> createState() => _SignUpCreenContentState();
}

class _SignUpCreenContentState extends State<SignUpCreenContent> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _nameController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? _selectedImage;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height,
        ),
        child: IntrinsicHeight(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.086),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.053),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create your\nAccount',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: scaler.scale(27),
                          fontWeight: FontWeight.bold,
                          color: themeExtension?.contrastTextColor),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                EmailTextField(
                  controller: _emailController,
                  validator: TextfieldValidators.emailValidator,
                ),
                NameTextField(
                  controller: _nameController,
                ),
                PasswordTextField(
                  controller: _passwordController,
                  validator: TextfieldValidators.passwordValidator,
                  label: 'Password',
                ),
                PasswordTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return TextfieldValidators.passwordValidator(value);
                  },
                ),
                SizedBox(height: size.height * 0.037),
                _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Image.file(
                          File(_selectedImage!.path),
                          height: size.height * 0.135,
                          width: size.height * 0.135,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Image.asset(
                          'assets/images/placeholder.png',
                          height: size.height * 0.135,
                          width: size.height * 0.135,
                          fit: BoxFit.cover,
                        ),
                      ),
                SizedBox(height: size.height * 0.012),
                ImagePickerField(
                  onImageSelected: (image) {
                    setState(() {
                      _selectedImage = image;
                    });
                  },
                ),
                SizedBox(height: size.height * 0.037),
                SizedBox(
                  width: size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        if (formKey.currentState!.validate()) {
                          await widget.authRepository.signUp(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text,
                            _selectedImage?.path,
                          );
                        }
                      } catch (e) {
                        final errorText =
                            FirebaseErrorTextConverter.convertFirebaseError(
                                e.toString());
                        if (context.mounted) {
                          SnackBars.showErrorSnackbar(errorText, context);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: themeExtension?.primaryColor,
                      backgroundColor: themeExtension?.contrastTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.133,
                          vertical: size.height * 0.018),
                    ),
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: themeExtension?.primaryColor,
                            fontSize: scaler.scale(15),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
