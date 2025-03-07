import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  final Key? fromKey;
  const NameTextField({super.key, required this.controller, this.fromKey});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    final size = MediaQuery.of(context).size;

    /// ----------------- Widget ----------------- ///
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.0125),
      child: TextFormField(
        style: TextStyle(color: themeExtension?.mainTextColor),
        cursorColor: themeExtension?.mainTextColor,
        key: fromKey,
        validator: (value) => value!.isEmpty ? 'Name cannot be empty' : null,
        controller: controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: themeExtension?.mainTextColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: themeExtension?.mainTextColor as Color),
          ),
          labelText: 'Name',
          hintText: 'Name',
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
