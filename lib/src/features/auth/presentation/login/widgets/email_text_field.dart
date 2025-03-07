import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const EmailTextField({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.0125),
      child: TextFormField(
        validator: validator ?? (_) => null,
        controller: controller,
        cursorColor: themeExtension?.mainTextColor,
        style: TextStyle(color: themeExtension?.mainTextColor),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: themeExtension?.mainTextColor as Color),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(
            color: themeExtension?.mainTextColor,
          ),
          hintText: 'Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: themeExtension?.inputFieldBorderColor as Color),
          ),
          filled: true,
          fillColor: themeExtension?.inputFieldFillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        ),
      ),
    );
  }
}
