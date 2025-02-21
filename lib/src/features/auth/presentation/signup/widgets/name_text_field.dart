import 'package:flutter/material.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  final Key? fromKey;
  const NameTextField({super.key, required this.controller, this.fromKey});

  @override
  Widget build(BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.0125),
      child: TextFormField(
        key: fromKey,
        validator: (value) => value!.isEmpty ? 'Name cannot be empty' : null,
        controller: controller,
        decoration: InputDecoration(
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
