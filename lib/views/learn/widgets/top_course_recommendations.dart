import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/views/learn/model/course_model.dart';
import 'package:wizr/views/learn/widgets/course_card/course_card.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class TopCourseRecommendations extends StatelessWidget {
  const TopCourseRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w, bottom: 24.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'SKill proficiency quiz / '.toUpperCase(),
                    style: context.textTheme.displaySmall,
                  ),
                  TextSpan(
                    text: 'Quiz results'.toUpperCase(),
                    style: context.textTheme.displaySmall!
                        .withColor(AppColors.purpleDark),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 32.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h),
              color: AppColors.purpleText,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: ['Python', 'Beginners', 'Online']
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: RotatedChip(
                            chipColor: AppColors.sageGreen,
                            name: e,
                            radius: 10,
                            padding: EdgeInsets.symmetric(
                              vertical: 10.4.h,
                              horizontal: 12.3.w,
                            ),
                            labelStyle: context.textTheme.labelSmall!
                                .withColor(Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    bottom: 20,
                  ).h,
                  child: Text(
                    context.l10n.yourTopCourses,
                    style: context.textTheme.headlineLarge!
                        .copyWith(letterSpacing: 0.3)
                        .responsiveFont(context),
                  ),
                ),
                Column(
                  children: List.generate(
                    3,
                    (index) => CourseCard(
                      courseModel: CourseModel.allCourseList[index],
                      radius: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
