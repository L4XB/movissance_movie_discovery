import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  const PasswordTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.validator});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.0125),
      child: TextFormField(
        validator: widget.validator ?? (_) => null,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: themeExtension?.inputFieldBorderColor as Color),
          ),
          filled: true,
          fillColor: themeExtension?.inputFieldFillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
              color: themeExtension?.mainIconColor,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        obscureText: _obscureText,
      ),
    );
  }
}
