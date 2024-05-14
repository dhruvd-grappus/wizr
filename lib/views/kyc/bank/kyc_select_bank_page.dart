import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/form_fields.dart';
import 'package:wizr/views/kyc/bank/widgets/bank_grid.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';
import 'package:wizr/views/kyc/widgets/or_divider.dart';

class KycSelectBankPage extends StatelessWidget {
  const KycSelectBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.selectYourBank),
            SizedBox(
              height: 28.toResponsiveHeight(context),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .responsive(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.selectYourSalaryAccount,
                      style: context.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 16.toResponsiveHeight(context)),
                    SizedBox(
                      width: 296.toResponsiveWidth(context),
                      child: Text(
                        context.l10n.pleaseSelectOneBank,
                        maxLines: 2,
                        style: context.textTheme.bodyMedium!
                            .responsiveFont(context)
                            .withColor(AppColors.financeBlueDark)
                            .withOpacity(0.72),
                      ),
                    ),
                    SizedBox(height: 28.toResponsiveHeight(context)),
                    BankGrid(
                      banks:
                          [1, 2, 3, 4, 5, 6, 7, 8].map((e) => 'HDFC').toList(),
                    ),
                    SizedBox(height: 32.toResponsiveHeight(context)),
                    const ORDivider(),
                    SizedBox(height: 32.toResponsiveHeight(context)),
                    CurvedTextFormField(
                      enabled: false,
                      focusedBorderColor: AppColors.purpleText.withOpacity(0.5),
                      textInputType: TextInputType.phone,
                      controller: TextEditingController(),
                      hint: context.l10n.searchYourBank,
                      prefix: Container(
                        margin: const EdgeInsets.only(right: 13, top: 5)
                            .responsive(context),
                        child: SvgPicture.asset(
                          AssetIcons.search,
                          height: 24.toResponsiveHeight(context),
                          // ignore: deprecated_member_use
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
