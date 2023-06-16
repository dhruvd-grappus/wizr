// ignore_for_file: lines_longer_than_80_chars

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class CourseCategoryInfo extends StatelessWidget {
  const CourseCategoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
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
                    'Design impactful user experiences for products in today’s digital world. Build a portfolio that showcases your ability...Read more',
                    style: context.textTheme.bodyMedium!
                        .withColor(AppColors.purple1),
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
                          Flexible(
                            child: Align(
                              child: Wrap(
                                children: [
                                  RotatedChip(
                                    name: 'IT & Development',
                                    chipColor: Colors.black,
                                    labelStyle: context.textTheme.displayLarge!
                                        .copyWith(fontSize: 12)
                                        .white,
                                    angle: 4.23 * (math.pi / 180),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            RotatedChip(
                                              name: 'Healthcare',
                                              chipColor: Colors.black,
                                              labelStyle: context
                                                  .textTheme.displayLarge!
                                                  .copyWith(fontSize: 12)
                                                  .white,
                                              angle: -7 * (math.pi / 180),
                                            ),
                                            RotatedChip(
                                              name: 'Linguistics',
                                              chipColor: Colors.black,
                                              labelStyle: context
                                                  .textTheme.displayLarge!
                                                  .copyWith(fontSize: 12)
                                                  .white,
                                              angle: -11 * (math.pi / 180),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RotatedChip(
                                        name: 'Linguistics',
                                        chipColor: Colors.black,
                                        labelStyle: context
                                            .textTheme.displayLarge!
                                            .copyWith(fontSize: 12)
                                            .white,
                                        angle: 7.2 * (math.pi / 180),
                                      ),
                                    ],
                                  ),
                                  Transform.translate(
                                    offset: const Offset(0, -10),
                                    child: RotatedChip(
                                      name: 'Data Science',
                                      chipColor: Colors.black,
                                      labelStyle: context
                                          .textTheme.displayLarge!
                                          .copyWith(fontSize: 12)
                                          .white,
                                      angle: -10 * (math.pi / 180),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
