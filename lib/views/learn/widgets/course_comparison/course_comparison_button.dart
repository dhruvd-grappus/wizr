import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';
import 'package:wizr/views/learn/controller/learn_controller.dart';
import 'package:wizr/views/learn/widgets/course_comparison/course_comparison_screen.dart';

class CourseComparisonButton extends StatelessWidget {
  CourseComparisonButton({super.key});
  final LearnController learnController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (learnController.selectedComparisonList.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          height: 86.h,
          margin: EdgeInsets.only(top: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.all(
              color: AppColors.purple1,
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AssetIcons.sealCheck,
                height: 18.w,
                width: 18.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                ),
                width: 144.w,
                child: Text(
                  '${learnController.selectedComparisonList.length}'
                  ' ${context.l10n.courseAddedtocompare}',
                  style: context.textTheme.labelSmall
                      ?.copyWith(color: AppColors.purpleText),
                ),
              ),
              const Spacer(),
              Obx(
                () {
                  return InkWell(
                    onTap: () {
                      showRoundedBottomSheet(
                        context,
                        CourseComparisonScreen(),
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 129.w,
                      height: 42.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: learnController.selectedComparisonList.length > 1
                            ? AppColors.purpleText
                            : AppColors.purpleBackground,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            context.l10n.compare,
                            style: context.textTheme.labelSmall!.copyWith(
                              color: learnController
                                          .selectedComparisonList.length >
                                      1
                                  ? Colors.white
                                  : AppColors.midnightGreyDark,
                            ),
                          ),
                          SvgPicture.asset(
                            AssetIcons.arrowUp,
                            // ignore: deprecated_member_use
                            color:
                                learnController.selectedComparisonList.length >
                                        1
                                    ? Colors.white
                                    : AppColors.midnightGreyDark,
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
