import 'package:flutter/material.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
part 'font_weights.dart';
part 'text_style_extensions.dart';

abstract class CustomTextStyles {
  static const _patronStyle = TextStyle(fontFamily: 'Patron');
  static const _interStyle = TextStyle(fontFamily: 'Inter');
  static TextStyle headlineLarge = _patronStyle.copyWith(
    fontSize: 31,
    fontWeight: CustomFontWeights.bold,
    color: Colors.white,
  );
  static TextStyle headlineMedium = _patronStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.midnightBlack,
    letterSpacing: 1.3,
    wordSpacing: 0.3,
  );
  static TextStyle labelLarge = _interStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: -0.01,
  );
  static TextStyle labelMedium = _interStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: -0.01,
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
  static TextStyle displaySmall = _interStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.purple1,
    letterSpacing: -0.01,
  );

  static TextStyle headlineSmall = _patronStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    letterSpacing: 0.02,
  );

  static TextStyle displayLarge = _patronStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    letterSpacing: 0.02,
  );

  static TextStyle captionMedium = _interStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    letterSpacing: 0.02,
  );
}
