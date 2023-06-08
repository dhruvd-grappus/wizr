// ignore_for_file: unused-code
import 'package:flutter/material.dart';

class AppColors extends MaterialColor {
  const AppColors(super.primary, super.swatch);
  static const primaryGrey = Colors.grey;
  static const offWhiteBackground = Color(0xFFF2F5F5);
  static const borderGray = Color.fromRGBO(16, 32, 49, 0.08);
  static const yellow = Color(0xFFCBFB62);
}

extension ColorExtension on String {
  Color toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
    return Colors.transparent;
  }
}
