import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/views/learn/controller/learn_controller.dart';
import 'package:wizr/views/learn/model/course_model.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

part 'course_price_details.dart';
part 'star_rater.dart';

class CourseCard extends StatelessWidget {
  CourseCard({
    required this.courseModel,
    super.key,
    this.radius = 0,
    this.bottomMargin = 16,
  });

  final double radius;
  final double bottomMargin;
  final CourseModel courseModel;

  final LearnController learnController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(courseModel.id),
      margin: EdgeInsets.only(bottom: bottomMargin.h),
      padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedChip(
                name: courseModel.courseLevel,
                radius: 7,
                labelStyle:
                    context.textTheme.labelSmall!.responsiveFont(context),
                chipColor: AppColors.purple1.withOpacity(0.8),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 8).w,
              ),
              Obx(() {
                return InkWell(
                  onTap: () {
                    learnController.updateCourseCompare(courseModel);
                  },
                  child: Row(
                    children: [
                      Text(
                        learnController.selectedComparisonList
                                .contains(courseModel)
                            ? context.l10n.shortlistedForComparision
                            : context.l10n.compare,
                        style: context.textTheme.bodyMedium!
                            .withColor(AppColors.purpleText),
                      ),
                      if (learnController.selectedComparisonList
                          .contains(courseModel))
                        Container(
                          padding: const EdgeInsets.only(left: 4),
                          child: SvgPicture.asset(
                            AssetIcons.sealCheck,
                          ),
                        )
                      else
                        SvgPicture.asset(AssetIcons.compare),
                    ],
                  ),
                );
              })
            ],
          ),
          SizedBox(height: 18.h),
          Image.asset(
            courseModel.courseProviderImage,
          ),
          SizedBox(height: 11.h),
          Container(
            constraints: BoxConstraints(maxWidth: context.screenWidth / 1.6),
            child: Text(
              courseModel.courseTitle,
              style: context.textTheme.displayLarge!.responsiveFont(context),
            ),
          ),
          SizedBox(height: 13.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '${courseModel.ratings}',
                    style:
                        context.textTheme.displayLarge!.responsiveFont(context),
                  ),
                  SizedBox(width: 6.1.w),
                  StarRater(
                    onRatingChanged: (_) {
                      debugPrint('callback');
                    },
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AssetIcons.discount),
                    const SizedBox(width: 2.4),
                    Text(
                      context.l10n.zeroCostEMI,
                      style: context.textTheme.labelSmall,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 21.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CoursePriceDetails(),
              Row(
                children: [
                  SvgPicture.asset(AssetIcons.like),
                  const SizedBox(width: 5),
                  PrimaryButton(
                    label: context.l10n.viewDetails,
                    margin: EdgeInsets.zero,
                    height: 32,
                    backgroundColor:
                        radius > 0 ? AppColors.purpleText : Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
