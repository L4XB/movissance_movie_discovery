import 'package:flutter/cupertino.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Widget ----------------- ///
    return Center(
      child: Text(message),
    );
  }
}
