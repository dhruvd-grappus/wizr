import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/views/course_recommendations/widgets/level_tile.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class ComfortLevelPage extends StatelessWidget {
  const ComfortLevelPage({
    required this.next, super.key,
  });

  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Text(
            'What is your current\ncomfort level in User\nExperience Design?',
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
          AnimationLimiter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 800),
                childAnimationBuilder: (widget) => FadeInAnimation(
                  child: widget,
                ),
                children: [
                  LevelTile(
                    label: 'Basic',
                    bodyText:
                        'Introduction to a subject, minimal skill and knowledge.',
                    iconPath: AssetIcons.icOnline,
                    onTap: () => goToNextPage(context),
                  ),
                  SizedBox(height: 22.h),
                  LevelTile(
                    label: 'Intermediate',
                    bodyText: 'Moderate or middle-level skill and knowledge.',
                    iconPath: AssetIcons.icOffline,
                    onTap: () => goToNextPage(context),
                  ),
                  SizedBox(height: 22.h),
                  LevelTile(
                    label: 'Advance',
                    bodyText:
                        'Extensive experience and high level of  skill and knowledge.',
                    iconPath: AssetIcons.icFlexible,
                    onTap: () => goToNextPage(context),
                  ),
                  SizedBox(height: 20.h),
                  RotatedChip(
                    name: 'Not Sure? Take our Skill Assessment',
                    labelStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    chipColor: const Color(0xFFDBDADC),
                    highlightColor: AppColors.yellow,
                    radius: 10,
                    onTap: () {
                      Fluttertoast.showToast(msg: 'Take our Skill Assessment');
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    //context.pushNamed(RouteNames.preferredLearningModePage);
    next.call();
  }
}
