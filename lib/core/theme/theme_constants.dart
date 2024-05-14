import 'package:flutter/material.dart';
import 'package:wizr/core/theme/app_colors.dart';

import 'package:wizr/core/theme/typography/text_styles.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    modalElevation: 0,
    dragHandleColor: Colors.white,
    backgroundColor: Colors.white,
    showDragHandle: false,
  ),
  colorScheme: const ColorScheme(
    onPrimary: Colors.yellow,
    primary: Colors.yellow,
    error: Colors.red,
    onError: Colors.red,
    onSurface: Colors.black,
    surface: Colors.black,
    onBackground: Colors.black,
    secondary: Colors.black,
    onSecondary: Colors.black,
    brightness: Brightness.dark,
    background: Colors.white,
  ),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  scaffoldBackgroundColor: AppColors.offWhiteBackground,
  primaryColor: Colors.black,
  textTheme: TextTheme(
    labelLarge: CustomTextStyles.labelLarge,
    headlineLarge: CustomTextStyles.headlineLarge,
    headlineMedium: CustomTextStyles.headlineMedium,
    headlineSmall: CustomTextStyles.headlineSmall,
    labelSmall: CustomTextStyles.labelSmall,
    labelMedium: CustomTextStyles.labelMedium,
    bodyMedium: CustomTextStyles.bodyMedium,
    bodySmall: CustomTextStyles.captionMedium,
    displaySmall: CustomTextStyles.displaySmall,
    displayLarge: CustomTextStyles.displayLarge,
  ),
);

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
