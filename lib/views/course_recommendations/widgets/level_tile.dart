import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';

class LevelTile extends StatelessWidget {
  const LevelTile({
    required this.label,
    required this.bodyText,
    required this.iconPath,
    super.key,
    this.onTap,
  });

  final String label;
  final String bodyText;
  final String iconPath;
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
            height: 116.h,
            padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
            child: Row(
              children: [
                SvgPicture.asset(iconPath, width: 90, fit: BoxFit.fill, ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: context.textTheme.headlineSmall,),
                      SizedBox(height: 12.h),
                      Text(bodyText, style: context.textTheme.bodyMedium,),
                    ],
                  ),
                ),
              ],
            ),
            /*Stack(
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
                  child: Icon(Icons.info_outline, color: Colors.black),
                ),
              ],
            ),*/
          ),
        ),
      ),
    );
  }
}
