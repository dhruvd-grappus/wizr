import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class CommonCourseCompareCard extends StatelessWidget {
  const CommonCourseCompareCard({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.labelSmall?.copyWith(
            color: AppColors.purpleDark,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: context.screenWidth,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black12,
            ),
          ),
        ),
      ],
    );
  }
}
