import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

import 'package:wizr/views/learn/controller/learn_controller.dart';

class CommonCourseCompareCard extends StatelessWidget {
  CommonCourseCompareCard({
    required this.title,
    super.key,
    this.cardType = CourseComareCardType.text,
    this.bodyText,
    this.imagePath,
    this.bulletList,
    this.widget,
  });
  final String title;
  final String? bodyText;
  final String? imagePath;
  final List<String>? bulletList;
  final Widget? widget;

  final CourseComareCardType cardType;
  final LearnController learnController = Get.find();
  @override
  Widget build(BuildContext context) {
    Widget? widget;
    switch (cardType) {
      case CourseComareCardType.text:
        widget = Text(
          bodyText ?? '',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.purpleDark,
          ),
          maxLines: 4,
        );

      case CourseComareCardType.bulletPoints:
      case CourseComareCardType.checkIcon:
        widget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetIcons.sealCheck),
            SizedBox(width: 4.w),
            Obx(
              () {
                return SizedBox(
                  width: (context.screenWidth /
                          learnController.intCompareCourseCount.value) -
                      60.w,
                  child: Text(
                    bodyText ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.purpleDark,
                    ),
                    maxLines: 4,
                  ),
                );
              },
            ),
          ],
        );
      case CourseComareCardType.customWidget:
      case CourseComareCardType.image:
        widget = Center(
          child: Image.asset(
            imagePath!,
            fit: BoxFit.contain,
          ),
        );
    }

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
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          child: Obx(
            () {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  learnController.intCompareCourseCount.value,
                  (index) => SizedBox(
                    width: (context.screenWidth /
                            learnController.intCompareCourseCount.value) -
                        38.w,
                    child: widget ?? const SizedBox(),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

enum CourseComareCardType { text, image, bulletPoints, checkIcon, customWidget }
