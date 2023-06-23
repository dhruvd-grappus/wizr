import 'package:flutter/material.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class RotatedChip extends StatelessWidget {
  const RotatedChip({
    required this.name,
    super.key,
    this.textColor = Colors.black,
    this.chipColor = Colors.white,
    this.highlightColor = Colors.transparent,
    this.onTap,
    this.actionIconColor,
    this.angle = 0,
    this.tailWidget,
    this.labelStyle,
    this.radius = 30,
    this.padding,
  });

  final String name;
  final Color? textColor;
  final Color? chipColor;
  final Color? highlightColor;
  final VoidCallback? onTap;
  final Color? actionIconColor;
  final double? angle;
  final Widget? tailWidget;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: highlightColor,
            highlightColor: highlightColor,
            child: Ink(
              color: chipColor,
              padding: padding ??
                  const EdgeInsets.fromLTRB(20, 14, 20, 14).responsive(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: labelStyle ??
                        TextStyle(
                          fontFamily: 'Patron',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ).responsiveFont(context),
                  ),
                  if (tailWidget != null) const SizedBox(width: 6),
                  if (tailWidget != null) tailWidget!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
