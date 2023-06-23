import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/app_checkbox.dart';

class CourseQuizCompletedPage extends StatelessWidget {
  const CourseQuizCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 13).responsive(context),
          width: context.screenWidth,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 11)
              .responsive(context),
          decoration: ShapeDecoration(
            color: const Color(0xFFA198AC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 64.h),
              Text(
                context.l10n.youAreAllSet,
                style: context.textTheme.headlineLarge!
                    .copyWith(color: AppColors.purpleDark),
              ),
              SizedBox(height: 24.h),
              Text(
                context.l10n.weAreFindingBestMatches,
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge!
                    .copyWith(color: AppColors.purpleText),
              ),
              Expanded(child: Container()),
              Image.asset(
                AssetImages.pinch,
                height: 86.h,
              ),
              SizedBox(height: 24.h),
              TweenAnimationBuilder<double>(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                onEnd: () {
                  context.goNamed(RouteNames.learnPage);
                },
                tween: Tween<double>(
                  begin: 0,
                  end: 1,
                ),
                builder: (context, value, _) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: LinearProgressIndicator(
                      value: value,
                      color: AppColors.yellow,
                      minHeight: 9,
                      backgroundColor: AppColors.purpleText.withOpacity(0.2),
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
              Align(
                child: AppCheckBox(
                  center: true,
                  widget: Text(
                    context.l10n.addingAPinchOfMagic,
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: AppColors.purpleText),
                  ),
                  onChanged: (_) {
                    /// TODO(*): On Changed}
                  },
                ),
              ),
              SizedBox(height: 58.h),
            ],
          ),
        ),
      ),
    );
  }
}
