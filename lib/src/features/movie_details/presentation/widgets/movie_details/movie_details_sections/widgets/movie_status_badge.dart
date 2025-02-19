import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/config.dart';

class MovieStatusBadge extends StatelessWidget {
  final String status;

  const MovieStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: statusColor[status] ?? CupertinoColors.systemGrey2),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.025, vertical: size.height * 0.003),
        child: Text(
          status,
          style: TextStyle(
            fontSize: scaler.scale(15),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
