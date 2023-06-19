import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/views/learn/widgets/course_card/course_card.dart';

class AllCoursesList extends StatelessWidget {
  const AllCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      color: AppColors.offWhiteBackground,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.h),
          Padding(
            padding: const EdgeInsets.only(left: 16).responsive(context),
            child: Text(
              'Showing all UX Design\nCourses',
              style: context.textTheme.headlineLarge!
                  .copyWith(
                    fontSize: 25.h,
                  )
                  .black,
            ),
          ),
          SizedBox(height: 27.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => const CourseCard(bottomMargin: 1),
            separatorBuilder: (_, index) => Container(height: 1),
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}
