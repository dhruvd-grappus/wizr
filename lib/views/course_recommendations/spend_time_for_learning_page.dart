import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/widgets/form_fields.dart';
import 'package:wizr/views/course_recommendations/widgets/highlighted_fold_card.dart';

class SpendTimeForLearningPage extends StatelessWidget {
  const SpendTimeForLearningPage({required this.modeOfLearning, super.key});
  final String modeOfLearning;
  @override
  Widget build(BuildContext context) {
    final bottom2 = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.timeToSpendLearning,
              style: context.textTheme.headlineMedium?.size25
                  .copyWith(letterSpacing: 0.08),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Text(
              context.l10n.weWouldLikeToKnowYouBetter,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.purpleText,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            HighlightedFoldCard(
              assetImage: AssetImages.online,
              title: 'I want to learn $modeOfLearning',
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: bottom2 == 0 ? 64 : 40,
            ),
            if (modeOfLearning == 'Offline')
              const _FormForOffline()
            else
              const _FormForOnline(),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    context.goNamed(RouteNames.learnPage);
  }
}

class _FormForOffline extends StatelessWidget {
  const _FormForOffline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.whatIsLearningPreferenceMode,
          style: context.textTheme.displayLarge,
        ),
        SizedBox(height: 24.h),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 14,
                color: AppColors.black.withOpacity(0.05),
              )
            ],
          ),
          child: CurvedTextFormField(
            suffix: SizedBox(
              width: 70.w,
              child: GestureDetector(
                onTap: () => context.goNamed(RouteNames.learnPage),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context.l10n.apply,
                      style: context.textTheme.labelLarge!.black
                          .responsiveFont(context),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Transform.translate(
                      offset: const Offset(0, 1),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
            hint: '000000',
            fillColor: AppColors.white,
            textInputType: TextInputType.phone,
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetIcons.mapPin),
            const SizedBox(width: 5),
            Text(
              'Nasik, Maharashtra',
              style:
                  context.textTheme.bodyMedium!.withColor(AppColors.purpleText),
            )
          ],
        )
      ],
    );
  }
}

class _FormForOnline extends StatelessWidget {
  const _FormForOnline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.whatIsLearningPreferenceMode,
          style: context.textTheme.displayLarge,
        ),
        SizedBox(height: 24.h),
        Column(
          children: [
            context.l10n.selfPaced,
            context.l10n.liveInstructor,
            context.l10n.imFlexible
          ]
              .map(
                (e) => GestureDetector(
                  onTap: () => context.goNamed(RouteNames.learnPage),
                  child: Container(
                    width: 342.w,
                    margin: EdgeInsets.only(bottom: 20.h),
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF50495A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelLarge!.white,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
