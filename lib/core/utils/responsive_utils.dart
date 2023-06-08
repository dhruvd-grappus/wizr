import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenUtils {
  static const double figmaScreenHeight = 844;
  static const double figmaScreenWidth = 390;
}

/// Converts the value with respect to the component:figma Screen ratio.
extension ResponsiveIntegerConstraints on num {
  double toResponsiveHeight(BuildContext context) {
    return this * context.screenHeight / ScreenUtils.figmaScreenHeight;
  }

  double toResponsiveWidth(BuildContext context) {
    return this * context.screenWidth / ScreenUtils.figmaScreenWidth;
  }
}

extension ScreenDimensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;
}

void hideKeyBoard() {
  SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
}

extension ResponsiveEdgeInsets on EdgeInsets {
  EdgeInsets responsive(BuildContext context) => copyWith(
        left: left.toResponsiveWidth(context),
        right: right.toResponsiveWidth(context),
        top: top.toResponsiveHeight(context),
        bottom: bottom.toResponsiveHeight(context),
      );
}
