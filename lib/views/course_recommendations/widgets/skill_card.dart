import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    required this.name,
    super.key,
    this.onTap,
  });

  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: AppColors.yellow,
          highlightColor: AppColors.yellow,
          child: Ink(
            color: AppColors.purpleBackground,
            height: 106.h,
            //padding: padding ?? const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      name,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppColors.purpleText,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 13.87.h,
                  right: 13.87.w,
                  child: const Icon(Icons.info_outline, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
