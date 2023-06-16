import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/app_header.dart';
import 'package:wizr/core/widgets/buttons.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: context.screenWidth,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.financeBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.toResponsiveHeight(context)),
                      Text(
                        context.l10n.financeHome,
                        style: context.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12.toResponsiveHeight(context)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          AssetImages.creditLimit,
                        ),
                      ),
                      SizedBox(height: 24.toResponsiveHeight(context)),
                      Text(
                        context.l10n.youUnlockedYour,
                        style: context.textTheme.headlineMedium,
                      ),
                      Row(
                        children: [
                          const AppLogo(),
                          const SizedBox(width: 2),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.credBlue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(AssetImages.cred),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            context.l10n.creditLimit,
                            style: context.textTheme.headlineMedium,
                          )
                        ],
                      ),
                      SizedBox(height: 10.toResponsiveHeight(context)),
                      Text(
                        context.l10n.leanWithWizer,
                        style:
                            context.textTheme.labelMedium?.opacity70.copyWith(
                          letterSpacing: 1.2,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 12.toResponsiveHeight(context)),
                      const CreditLimitCard(),
                      SizedBox(height: 12.toResponsiveHeight(context)),
                      PrimaryButton(
                        label: context.l10n.activateYourCreditLimit,
                        onTap: () => context.goNamed(RouteNames.phoneLoginPage),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreditLimitCard extends StatelessWidget {
  const CreditLimitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 70.toResponsiveHeight(context),
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(AssetImages.civil),
    );
  }
}
