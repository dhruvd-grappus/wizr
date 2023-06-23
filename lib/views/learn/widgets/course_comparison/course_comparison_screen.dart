import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';
import 'package:wizr/views/learn/controller/learn_controller.dart';
import 'package:wizr/views/learn/widgets/course_comparison/common_course_compare_card.dart';

class CourseComparisonScreen extends StatelessWidget {
  CourseComparisonScreen({super.key});
  final LearnController learnController = Get.find();
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: RoundedBottomSheet(
        maxSize: 0.9,
        initialSize: 0.9,
        draggable: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 28.h),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Row(
                    children: [
                      Obx(
                        () {
                          return Text(
                            'Comparing'
                            ' ${learnController.selectedComparisonList.length}'
                            ' courses',
                            style: context.textTheme.headlineSmall,
                          );
                        },
                      ),
                      const Spacer(),
                      Text(
                        context.l10n.dismiss,
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: AppColors.purpleDark),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12.w),
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: AppColors.purpleBackground,
                        ),
                        child: Center(
                          child: SvgPicture.asset(AssetIcons.arrowDown),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 48.h),
                Column(
                  children: [
                    CourseEnrollSection(),
                    SizedBox(height: 40.h),
                    const CommonCourseCompareCard(
                      title: 'Provider',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseEnrollSection extends StatelessWidget {
  CourseEnrollSection({
    super.key,
  });

  final LearnController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            controller.selectedComparisonList.length,
            (index) => SizedBox(
              width: (context.screenWidth /
                      controller.selectedComparisonList.length) -
                  32.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.updateCourseCompare(
                          controller.selectedComparisonList[index],
                        );
                        if (controller.selectedComparisonList.isEmpty) {
                          context.pop();
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              controller
                                  .selectedComparisonList[index].courseTitle,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.displayLarge,
                            ),
                          ),
                          SvgPicture.asset(
                            AssetIcons.close,
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Center(
                        child: Text(
                          context.l10n.enrolNow,
                          style: context.textTheme.labelSmall
                              ?.copyWith(color: AppColors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
