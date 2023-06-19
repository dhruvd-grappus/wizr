import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

part 'course_price_details.dart';
part 'star_rater.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, this.radius = 0});
  factory CourseCard.rounded() {
    return const CourseCard(
      radius: 20,
    );
  }
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
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
                name: 'Intermediate',
                radius: 7,
                labelStyle:
                    context.textTheme.labelSmall!.responsiveFont(context),
                chipColor: AppColors.purple1,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4).h,
              ),
              Row(
                children: [
                  Text(
                    context.l10n.compare,
                    style: context.textTheme.bodyMedium!
                        .withColor(AppColors.purpleText),
                  ),
                  SvgPicture.asset(AssetIcons.compare)
                ],
              )
            ],
          ),
          SizedBox(height: 18.h),
          Image.asset(
            'assets/images/test_course_brand.png',
          ),
          SizedBox(height: 11.h),
          Container(
            constraints: BoxConstraints(maxWidth: context.screenWidth / 1.6),
            child: Text(
              'Masters Program in ETABS & Safe Software for RCC Composite...',
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
                    '4.0',
                    style:
                        context.textTheme.displayLarge!.responsiveFont(context),
                  ),
                  SizedBox(width: 6.1.w),
                  StarRater(
                    onRatingChanged: (_) {},
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
                    backgroundColor: AppColors.purpleText,
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
