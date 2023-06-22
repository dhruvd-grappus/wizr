// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';

class CourseCategoryInfo extends StatelessWidget {
  const CourseCategoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Experience Design',
                style: context.textTheme.headlineMedium!
                    .copyWith(fontSize: 25.h, letterSpacing: 0.3),
              ),
              SizedBox(height: 24.h),
              Text(
                'Design impactful user experiences for products in todays digital world. Build a portfolio that showcases your ability...Read more',
                style:
                    context.textTheme.bodyMedium!.withColor(AppColors.purple1),
              ),
            ],
          ),
        ),
        SizedBox(height: 28.h),
        SizedBox(
          height: 310.h,
          child: ListView(
            padding: EdgeInsets.only(left: 16.w),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              _RoundedListContainer(
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 53.h),
                      Image.asset(
                        'assets/images/test_course_metric.png',
                        height: 101.h,
                        fit: BoxFit.fitHeight,
                      ),
                      Expanded(child: Container()),
                      Text(
                        'Average Salary',
                        style: context.textTheme.displayLarge,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'What people typically earn in this field with a similar experience and profile.',
                        style: context.textTheme.bodyMedium!
                            .responsiveFont(context)
                            .withColor(AppColors.purple1),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
                color: AppColors.purpleBackground,
              ),
              _RoundedListContainer(
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Align(
                        child: Image.asset('assets/images/test_tags.png'),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'Future job roles',
                        style: context.textTheme.displayLarge,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Positions that are anticipated to be in demand in the coming years.',
                        style: context.textTheme.bodyMedium!
                            .responsiveFont(context)
                            .white,
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
                color: AppColors.purple1,
              ),
              _RoundedListContainer(
                body: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/test_thumbnail.png',
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 101.h),
                      Align(
                        child: SvgPicture.asset(
                          AssetIcons.play,
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        'Hear from other learners!',
                        style: context.textTheme.displayLarge!.white,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Lorem ipsum dolor sit ',
                        style: context.textTheme.bodyMedium!
                            .responsiveFont(context)
                            .white,
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
                color: AppColors.purple1,
              )
            ],
          ),
        )
      ],
    );
  }
}

class _RoundedListContainer extends StatelessWidget {
  const _RoundedListContainer({required this.body, required this.color});
  final Widget body;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 308.h,
      width: 230.w,
      margin: EdgeInsets.only(right: 14.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: body,
    );
  }
}
