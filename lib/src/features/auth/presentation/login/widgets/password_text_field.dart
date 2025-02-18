import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: TextFormField(
        validator: widget.validator ?? (_) => null,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        obscureText: _obscureText,
      ),
    );
  }
}
