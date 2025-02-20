import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  final Key? fromKey;
  const NameTextField({super.key, required this.controller, this.fromKey});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.0125),
      child: TextFormField(
        key: fromKey,
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        ),
      ),
    );
  }
}
