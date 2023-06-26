import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wizr/core/widgets/animated_primary_button.dart';

class RectClipper extends CustomClipper<Path> {
  RectClipper(this.clipFactor, this.transitionType);

  final double clipFactor;
  final TransitionType transitionType;

  @override
  Path getClip(Size size) {
    final path = Path();

    switch (transitionType) {
      case TransitionType.LEFT_TO_RIGHT:
        path.lineTo(size.width * clipFactor, 0);
        path.lineTo(size.width * clipFactor, size.height);
        path.lineTo(0, size.height);
      case TransitionType.RIGHT_TO_LEFT:
        path.moveTo(size.width, 0);
        path.lineTo(size.width * clipFactor, 0);
        path.lineTo(size.width * clipFactor, size.height);
        path.lineTo(size.width, size.height);

      case TransitionType.TOP_TO_BOTTOM:
        path.lineTo(0, size.height * clipFactor);
        path.lineTo(size.width, size.height * clipFactor);
        path.lineTo(size.width, 0);
      case TransitionType.BOTTOM_TO_TOP:
        path.moveTo(0, size.height);
        path.lineTo(0, size.height * clipFactor);
        path.lineTo(size.width, size.height * clipFactor);
        path.lineTo(size.width, size.height);

      case TransitionType.CENTER_ROUNDED:
        path.addOval(
          Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius:
                sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor,
          ),
        );
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
