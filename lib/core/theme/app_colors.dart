// ignore_for_file: unused-code
import 'package:flutter/material.dart';

class AppColors extends MaterialColor {
  const AppColors(super.primary, super.swatch);
  static const primaryGrey = Colors.grey;
  static const lightGrey = Color(0xffF0EAE4);
  static const offWhiteBackground = Color(0xFFF2F5F5);
  static const borderGray = Color.fromRGBO(16, 32, 49, 0.08);
  static const yellow = Color(0xFFCBFB62);
  static const white = Colors.white;
  static const black = Colors.black;
  static const fadeBlue = Color(0xffBDD9F1);
  static const tabColor = Color(0xff102031);
  static const greyTextColor = Color(0xff838F97);
  static const midnigthBlack = Color(0xff161C20);
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
