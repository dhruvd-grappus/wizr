import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class ChooseSubjectPage extends StatelessWidget {
  const ChooseSubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.goNamed(RouteNames.landingPage);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Text(
                'Choose your subject for\nskilling',
                style: context.textTheme.headlineMedium?.size25,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28.h),
              Wrap(
                runSpacing: 12.h,
                spacing: 12.w,
                alignment: WrapAlignment.center,
                children: <Widget>[
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
              SizedBox(height: 90.h),
              RotatedChip(
                name: 'Take our Career Discovery Quiz',
                labelStyle: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black2,
                ),
                chipColor: const Color(0xFFDBDADC),
                highlightColor: AppColors.yellow,
                radius: 10,
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    context.pushNamed(RouteNames.pickSkillPage);
  }
}
