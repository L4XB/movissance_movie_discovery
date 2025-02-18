import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_line/src/common/utils/textfield_validators.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/email_text_field.dart';
import 'package:red_line/src/features/auth/presentation/login/widgets/password_text_field.dart';
import 'package:red_line/src/features/auth/presentation/signup/widgets/image_picker_field.dart';
import 'package:red_line/src/features/auth/presentation/signup/widgets/name_text_field.dart';

class SignupScreen extends StatefulWidget {
  final AuthRepository authRepository;
  const SignupScreen({super.key, required this.authRepository});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _nameController;
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
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Create your\nAccount',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 30),
          _selectedImage != null
              ? Image.file(
                  File(_selectedImage!.path),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/placeholder.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
          const SizedBox(height: 10),
          ImagePickerField(
            onImageSelected: (image) {
              setState(() {
                _selectedImage = image;
              });
            },
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: size.width * 0.9,
            child: ElevatedButton(
              onPressed: () {
                // TODO: handle signup
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Sign Up',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
