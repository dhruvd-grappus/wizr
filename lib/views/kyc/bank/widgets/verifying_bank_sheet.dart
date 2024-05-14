import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';

class VerifyingBankSheet extends StatelessWidget {
  const VerifyingBankSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBottomSheet(
      body: Column(
        children: [
          SizedBox(
            width: context.screenWidth,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(19),
                topRight: Radius.circular(19),
              ),
              child: Image.asset(
                AssetImages.verifyProgress,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 55.toResponsiveHeight(context)),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 16).responsive(context),
            child: Column(
              children: [
                Text(
                  context.l10n.greatWeAreVerifying,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge!
                      .copyWith(fontSize: 25, color: Colors.black)
                      .responsiveFont(context),
                ),
                SizedBox(height: 20.toResponsiveHeight(context)),
                Text(
                  context.l10n.weAreDepositingRs,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelLarge!
                      .copyWith(
                        color: AppColors.financeBlueDark.withOpacity(0.8),
                      )
                      .responsiveFont(context),
                ),
                SizedBox(height: 52.toResponsiveHeight(context)),
                Text(
                  context.l10n.verificationInProgress,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelMedium!
                      .copyWith(color: AppColors.financeBlueDark)
                      .responsiveFont(context),
                ),
                SizedBox(height: 20.toResponsiveHeight(context)),
                TweenAnimationBuilder<double>(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  onEnd: () {
                    context.pop(true);
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
                SizedBox(
                  height: 58.toResponsiveHeight(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
