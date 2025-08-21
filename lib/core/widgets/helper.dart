import 'package:flutter/material.dart';

class Helper {
  static double responsiveWidth(BuildContext context, {required double width}) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return width * (screenWidth / 400).clamp(0.8, 1.2);
  }

  static double responsiveHeight(
    BuildContext context, {
    required double height,
  }) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return height * (screenWidth / 800).clamp(0.8, 1.2);
  }
}