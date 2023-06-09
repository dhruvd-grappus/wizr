import 'package:flutter/material.dart';

import 'package:wizr/core/theme/typography/text_styles.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
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
  primaryColor: Colors.black,
  textTheme: TextTheme(
    labelLarge: CustomTextStyles.labelLarge,
    headlineLarge: CustomTextStyles.headlineLarge,
    headlineSmall: CustomTextStyles.headlineSmall,
    labelSmall: CustomTextStyles.labelSmall,
    labelMedium: CustomTextStyles.labelMedium,
    bodyMedium: CustomTextStyles.bodyMedium,
    bodySmall: CustomTextStyles.captionMedium,
    // bodySmall: CustomTextStyles.bodySmall,
    // bodyMedium: CustomTextStyles.bodyMedium,
    // headlineSmall: CustomTextStyles.headlineSmall,
    // bodyLarge: CustomTextStyles.bodyLarge,
    // headlineLarge: CustomTextStyles.headlineLarge,
    // labelMedium: CustomTextStyles.labelMedium,
    // labelLarge: CustomTextStyles.labelLarge,
    // labelSmall: CustomTextStyles.labelSmall,
  ),
);

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
