import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';

class IconHeader extends StatelessWidget {
  const IconHeader({
    required this.iconPath,
    this.containerSize = 36,
    this.iconSize = 16,
    this.color = AppColors.lightGrey,
    super.key,
  });
  final String iconPath;
  final double containerSize;
  final double iconSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: SvgPicture.asset(
        iconPath,
        width: iconSize,
        height: iconSize,
      ),
    );
  }
}
