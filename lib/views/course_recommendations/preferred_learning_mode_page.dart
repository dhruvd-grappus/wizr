import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/views/course_recommendations/widgets/level_tile.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class PreferredLearningModePage extends StatelessWidget {
  const PreferredLearningModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Text(
            'What is your preferred\nlearning mode?',
            style: context.textTheme.headlineMedium?.size25,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Text(
            'Before we can recommend you the right course,\nwe’d like to know you better.',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.purpleText,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
          LevelTile(
            label: 'Online',
            bodyText: 'I prefer learning from the comfort of my house',
            iconPath: AssetIcons.icOnline,
            onTap: () => goToNextPage(context),
          ),
          SizedBox(height: 22.h),
          LevelTile(
            label: 'Offline',
            bodyText: 'I want to attend in class courses to upskill myself',
            iconPath: AssetIcons.icOffline,
            onTap: () => goToNextPage(context),
          ),
          SizedBox(height: 22.h),
          LevelTile(
            label: 'I’m flexible',
            bodyText: 'I am open to hybrid modes of learning , as long as I find he course useful',
            iconPath: AssetIcons.icFlexible,
            onTap: () => goToNextPage(context),
          ),
          SizedBox(height: 60.h),
          RotatedChip(
            name: 'Not Sure? Take our Skill Assesssment',
            labelStyle: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black2,
            ),
            chipColor: const Color(0xFFDBDADC),
            highlightColor: AppColors.yellow,
            radius: 10,
            onTap: () {

            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void goToNextPage(BuildContext context, String mode) {
    context.pushNamed(
      RouteNames.spendTimeForLearningPage,
      queryParameters: {'mode': mode},
    );
  }
}
