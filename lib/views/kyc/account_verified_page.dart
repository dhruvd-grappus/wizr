import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';

class AccountVerifiedPage extends StatelessWidget {
  const AccountVerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: PrimaryButton(
        label: context.l10n.greatThanks,
        onTap: () => context.goNamed(RouteNames.landingPage),
      ),
      backgroundColor: AppColors.offWhiteBackground,
      body: Column(
        children: [
          Image.asset(
            AssetImages.accountVerified,
            width: context.screenWidth,
            height: 430.toResponsiveHeight(context),
            fit: BoxFit.fill,
          ),
          SizedBox(height: 47.toResponsiveHeight(context)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  context.l10n.congratulationsAccountVerified,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge!
                      .copyWith(fontSize: 25)
                      .responsiveFont(context)
                      .black,
                ),
                SizedBox(height: 20.toResponsiveHeight(context)),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4)
                      .responsive(context),
                  child: Text(
                    // ignore: lines_longer_than_80_chars
                    'Lorem ipsum dolor sit amet consectetur. Platea ultrices velit faucibus. Lorem ipsum dolor sit amet consectetur. ',
                    textAlign: TextAlign.center,
                    style: context.textTheme.labelLarge!
                        .withColor(AppColors.financeBlueDark.withOpacity(0.8))
                        .copyWith(height: 1.44)
                        .responsiveFont(context),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
