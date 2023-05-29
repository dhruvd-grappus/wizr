// ignore_for_file: unused-code
import 'package:flutter/material.dart';

class AppColors extends MaterialColor {
  const AppColors(super.primary, super.swatch);
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
