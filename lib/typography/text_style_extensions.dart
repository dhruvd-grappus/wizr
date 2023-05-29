part of 'text_styles.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) {
    return copyWith(color: color!.withOpacity(opacity));
  }

  TextStyle withColor(Color newColor) {
    return copyWith(color: newColor);
  }
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme.copyWith();
  }
}

extension FixedColorExtension on TextStyle {
  TextStyle get black {
    return withColor(Colors.black);
  }

  TextStyle get white {
    return withColor(Colors.white);
  }

  TextStyle get opacity50 {
    return withOpacity(0.5);
  }

  TextStyle get opacity70 {
    return withOpacity(0.7);
  }
}

extension FontSizeExtension on TextStyle {
  TextStyle get size16 {
    return copyWith(fontSize: 16);
  }

  TextStyle get size12 {
    return copyWith(fontSize: 12);
  }

  TextStyle get size13 {
    return copyWith(fontSize: 13);
  }

  TextStyle get size14 {
    return copyWith(fontSize: 14);
  }

  TextStyle get size18 {
    return copyWith(fontSize: 18);
  }

  TextStyle responsiveFont(BuildContext context) {
    return copyWith(
      fontSize: fontSize?.toResponsiveHeight(context),
      height: height?.toResponsiveHeight(context),
    );
  }
}
