import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RotatedChip extends StatelessWidget {
  const RotatedChip({
    required this.name,
    super.key,
    this.textColor = Colors.black,
    this.chipColor = Colors.white,
    this.onTap,
    this.actionIconColor,
    this.angle = 0,
    this.tailWidget,
    this.labelStyle,
    this.padding,
  });

  final String name;
  final Color? textColor;
  final Color? chipColor;
  final VoidCallback? onTap;
  final Color? actionIconColor;
  final double? angle;
  final Widget? tailWidget;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle!,
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: name);
        },
        child: Container(
          decoration: BoxDecoration(
            color: chipColor,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: padding ?? const EdgeInsets.fromLTRB(20, 14, 20, 14),
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
                    ),
              ),
              const SizedBox(width: 6),
              if (tailWidget != null) tailWidget!,
            ],
          ),
        ),
      ),
    );
  }
}
