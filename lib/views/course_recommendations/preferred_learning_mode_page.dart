import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/widgets/animated_primary_button.dart';
import 'package:wizr/views/course_recommendations/widgets/level_tile.dart';

class PreferredLearningModePage extends StatelessWidget {
  const PreferredLearningModePage({
    required this.next,
    super.key,
  });

  final ValueChanged<String> next;

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
          AnimationLimiter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 600),
                childAnimationBuilder: (widget) => FadeInAnimation(
                  child: widget,
                ),
                children: [
                  LevelTile(
                    label: 'Online',
                    bodyText: 'I prefer learning from the comfort of my house',
                    imgPath: AssetImages.imgOnlinePref,
                    onTap: () => goToNextPage(context, 'Online'),
                  ),
                  SizedBox(height: 22.h),
                  LevelTile(
                    label: 'Offline',
                    bodyText:
                        'I want to attend in class courses to upskill myself',
                    imgPath: AssetImages.imgOfflinePref,
                    onTap: () => goToNextPage(context, 'Offline'),
                  ),
                  SizedBox(height: 22.h),
                  LevelTile(
                    label: 'I’m flexible',
                    bodyText:
                        'I am open to hybrid modes of learning , as long as I find he course useful',
                    imgPath: AssetImages.imgFlexiblePref,
                    onTap: () => goToNextPage(context, 'Flexible'),
                  ),
                  SizedBox(height: 60.h),
                  AnimatedPrimaryButton(
                    height: 40,
                    margin: EdgeInsets.only(left: 30.w, right: 30.w),
                    text: 'Not Sure? Take our Skill Assessment',
                    textStyle: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black2,
                    ),
                    color: const Color(0xFFDBDADC),
                    borderRadius: 10,
                    onPressed: () {
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

  void goToNextPage(BuildContext context, String mode) {
    next.call(mode);
  }
}
