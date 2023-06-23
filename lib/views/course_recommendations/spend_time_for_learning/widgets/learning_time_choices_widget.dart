import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/views/course_recommendations/spend_time_for_learning/models/learn_time_option.dart';

class LearningTimeChoicesWidget extends StatelessWidget {
  const LearningTimeChoicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: LearnTimeOption.values
          .map(
            (e) => GestureDetector(
              onTap: () =>
                  context.pushNamed(RouteNames.courseQuizCompletedPage),
              child: Container(
                width: 342.w,
                height: 80.h,
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.all(11.63.h),
                decoration: ShapeDecoration(
                  color: AppColors.lightGrey3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.57),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.h,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 0.60,
                            color: AppColors.greyTextColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title(context),
                            style: context.textTheme.displayLarge,
                          ),
                          SizedBox(height: 12.h),
                          Opacity(
                            opacity: 0.70,
                            child: Text(
                              e.description(context),
                              style: context.textTheme.labelSmall!.withColor(
                                AppColors.purpleDark.withOpacity(0.72),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
