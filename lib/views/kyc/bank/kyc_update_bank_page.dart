import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';
import 'package:wizr/core/widgets/tab_header.dart';
import 'package:wizr/views/kyc/bank/widgets/other_account_type_sheet.dart';
import 'package:wizr/views/kyc/widgets/form_field.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycUpdateBankPage extends StatelessWidget {
  const KycUpdateBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          color: Colors.white,
          width: context.screenWidth,
          child: PrimaryButton(
            label: context.l10n.continueBtnLabel,
            active: false,
          ),
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.updateBankDetails),
            SizedBox(
              height: 21.toResponsiveHeight(context),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .responsive(context),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.l10n.accountType,
                        style: context.textTheme.labelSmall!
                            .responsiveFont(context),
                      ),
                      SizedBox(
                        height: 10.toResponsiveHeight(context),
                      ),
                      TabHeader(
                        tabTiles: [context.l10n.current, context.l10n.savings],
                        width:
                            context.screenWidth - 48.toResponsiveWidth(context),
                        onChanged: log,
                      ),
                      SizedBox(height: 20.toResponsiveHeight(context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                context.l10n.selectedType,
                                style: context.textTheme.labelMedium!.withColor(
                                  AppColors.tabColor.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(width: 7),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 13,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.fadeBlue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Credit',
                                      style: context.textTheme.labelSmall,
                                    ),
                                    Icon(
                                      Icons.close,
                                      color:
                                          AppColors.tabColor.withOpacity(0.72),
                                      size: 16,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 16)
                                .responsive(context),
                            child: GestureDetector(
                              onTap: () => showRoundedBottomSheet(
                                context,
                                const OtherAccountTypeSheet(),
                              ),
                              child: Text(
                                context.l10n.other,
                                style: context.textTheme.labelMedium!.copyWith(
                                  color: AppColors.financeBlueLight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.toResponsiveHeight(context)),
                      KycFormField(
                        controller: TextEditingController(),
                        label: context.l10n.bankName,
                        margin: const EdgeInsets.only(bottom: 12)
                            .responsive(context),
                      ),
                      Text(
                        context.l10n.bankSupportsNACH,
                        style: context.textTheme.bodyMedium!
                            .withColor(AppColors.brick),
                      ),
                      SizedBox(height: 21.toResponsiveHeight(context)),
                      KycFormField(
                        controller: TextEditingController(),
                        label: context.l10n.accountNumber,
                        textInputType: TextInputType.phone,
                        margin: const EdgeInsets.only(bottom: 21)
                            .responsive(context),
                      ),
                      KycFormField(
                        controller: TextEditingController(),
                        label: context.l10n.accountHolderName,
                        margin: const EdgeInsets.only(bottom: 21)
                            .responsive(context),
                      ),
                      KycFormField(
                        controller: TextEditingController(),
                        label: context.l10n.ifscCode,
                        textInputType: TextInputType.phone,
                        margin: const EdgeInsets.only(bottom: 21)
                            .responsive(context),
                      ),
                      const SizedBox(height: 100)
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
