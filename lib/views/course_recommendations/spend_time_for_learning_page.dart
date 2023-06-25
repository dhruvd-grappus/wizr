import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';

class SpendTimeForLearningPage extends StatelessWidget {
  const SpendTimeForLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Text(
            'How much time would you\nbe able to spend for\nlearning?',
            style: context.textTheme.headlineMedium?.size25,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          Text(
            'Before we can recommend you the right course,\nwe’d like to know you better.',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.purpleText,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

}
