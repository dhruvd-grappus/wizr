import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/tab_header.dart';
import 'package:wizr/views/kyc/widgets/form_field.dart';

class SelfEmployed extends StatelessWidget {
  SelfEmployed({super.key});
  final TextEditingController monthlyIncome = TextEditingController();
  final TextEditingController businessName = TextEditingController();
  final TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        width: context.screenWidth,
        child: PrimaryButton(
          label: context.l10n.continueBtnLabel,
          active: false,
        ),
      ),
      backgroundColor: AppColors.offWhiteBackground,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16).responsive(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.professionalDetails,
                style: context.textTheme.labelSmall!.responsiveFont(context),
              ),
              SizedBox(
                height: 12.toResponsiveHeight(context),
              ),
              TabHeader(
                tabTiles: [
                  context.l10n.professional,
                  context.l10n.nonProfessional
                ],
                width: context.screenWidth - 40.toResponsiveWidth(context),
                onChanged: log,
              ),
              SizedBox(height: 24.toResponsiveHeight(context)),
              KycFormField(
                controller: monthlyIncome,
                label: context.l10n.monthlyIncome,
              ),
              KycFormField(
                controller: businessName,
                label: context.l10n.businessName,
              ),
              KycFormField(
                controller: address,
                label: context.l10n.address,
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
