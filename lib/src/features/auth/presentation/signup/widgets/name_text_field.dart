import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  const NameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: TextFormField(
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
