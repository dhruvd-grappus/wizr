import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/widgets/animated_primary_button.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class ChooseSubjectPage extends StatelessWidget {
  const ChooseSubjectPage({
    required this.next,
    super.key,
  });

  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Text(
            'Choose your subject for\nskilling',
            style: context.textTheme.headlineMedium?.size25,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28.h),
          AnimationLimiter(
            child: Wrap(
              runSpacing: 12.h,
              spacing: 12.w,
              alignment: WrapAlignment.center,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 300),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  RotatedChip(
                    name: 'IT & Development',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Computer Science',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Business Management',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Design',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Data Science',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Teaching & Academics',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Marketing',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Linguistics',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'BFSI',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Travel & Hospitality',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Engineering',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Personal Development',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Arts',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Test & Preparation',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Science',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Beauty and Wellness',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Healthcare',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Human Resource',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                  RotatedChip(
                    name: 'Law',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: AppColors.purpleBackground,
                    highlightColor: AppColors.yellow,
                    radius: 12,
                    onTap: () => goToNextPage(context),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 90.h),
          AnimatedPrimaryButton(
            height: 40,
            margin: EdgeInsets.only(left: 50.w, right: 40.w),
            text: 'Take our Carrier Discovery Quiz',
            textStyle: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black2,
            ),
            color: const Color(0xFFDBDADC),
            borderRadius: 10,
            onPressed: () {
              Fluttertoast.showToast(msg: 'Take our Carrier Discovery Quiz');
            },
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    //context.pushNamed(RouteNames.pickSkillPage);
    next.call();
  }
}
