import 'package:flutter/material.dart';
import '../../utils/responsive_utils.dart';
part 'font_weights.dart';
part 'text_style_extensions.dart';

abstract class CustomTextStyles {
  static const _patronStyle = TextStyle(fontFamily: 'Patron');
  static const _interStyle = TextStyle(fontFamily: 'Inter');

  static TextStyle headlineLarge =
      _patronStyle.copyWith(fontSize: 31, fontWeight: CustomFontWeights.medium);

  static TextStyle labelLarge = _interStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle labelSmall = _interStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: -0.01,
  );

  static TextStyle bodyMedium = _interStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: -0.01,
  );

  static TextStyle headlineSmall = _patronStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.02,
  );
}
