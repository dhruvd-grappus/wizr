import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';
import 'package:wizr/views/kyc/widgets/kyc_card.dart';

class OtherAccountTypeSheet extends StatelessWidget {
  const OtherAccountTypeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBottomSheet(
      bodyColor: AppColors.offWhiteBackground,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16).responsive(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.toResponsiveHeight(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.selectAccountType,
                  style: context.textTheme.headlineSmall,
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: SvgPicture.asset(AssetIcons.close),
                )
              ],
            ),
            SizedBox(height: 34.toResponsiveHeight(context)),
            KycCard(
              title: context.l10n.creditAccount,
              iconPath: AssetIcons.bank,
              cardType: KycCardType.iconTitle,
              onTap: () {
                context.pop();
              },
              bodyText: 'Lorem ipsum dolor sit',
            ),
            SizedBox(height: 16.toResponsiveHeight(context)),
            KycCard(
              title: context.l10n.overDraftAccount,
              iconPath: AssetIcons.bank,
              cardType: KycCardType.iconTitle,
              onTap: () {
                context.pop();
              },
              bodyText: 'Lorem ipsum dolor sit',
            ),
            SizedBox(height: 16.toResponsiveHeight(context)),
          ],
        ),
      ),
    );
  }
}
