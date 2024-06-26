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
  static const financeBlue = Color(0xffBDD9F1);
  static const financeBlueLight = Color(0xff5B8FCF);
  static const credBlue = Color(0xff5B8ECA);
  static const financeBlueDark = Color(0xff102031);
  static const greyTextColor = Color(0xff838F97);
  static const midnightBlack = Color(0xff161C20);
  static const eggShell = Color(0xFFF0EAE4);
  static const midnightGrey = Color(0xFFEDF0F1);
  static const midnightGreyDark = Color(0xFF838F97);

  /// FF50495A
  static const purpleText = Color(0xff50495A);
  static const purple1 = Color(0xffA198AC);
  static const purpleBackground = Color(0xffF5F4F6);
  static const purpleDark = Color(0xff1D1B21);
  static const lightGrey2 = Color(0xff999999);
  static const lightGrey3 = Color(0xffF4F3F5);
  static const brick = Color(0xffB7704E);
  static const sageGreen = Color(0xff7E9392);
  static const lightBrown = Color(0xffE1D7C9);
  static const black2 = Color(0xff211D0C);
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
