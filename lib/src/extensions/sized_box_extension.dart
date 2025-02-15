import 'package:flutter/material.dart';

extension SizedBoxExtension on SizedBox {
  static SizedBox width(double width) {
    return SizedBox(width: width);
  }

  static SizedBox height(double height) {
    return SizedBox(height: height);
  }

  static SizedBox both(double width, double height) {
    return SizedBox(width: width, height: height);
  }
}
