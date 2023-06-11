import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/form_fields.dart';
import 'package:wizr/views/authentication/widgets/custom_signup_flow_page.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class PhoneLoginPage extends StatelessWidget {
  const PhoneLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSignupFlowPage(
      bottomButton: SizedBox(
        child: Column(
          children: [
            Container(
              constraints:
                  BoxConstraints(maxWidth: 250.toResponsiveWidth(context)),
              child: RichText(
                maxLines: 2,
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${context.l10n.byUsingWizr} ',
                      style: context.textTheme.labelSmall!
                          .withColor(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: context.l10n.termsAndPrivacy,
                      style: context.textTheme.labelSmall!
                          .withColor(AppColors.black),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.toResponsiveHeight(context)),
            PrimaryButton(
              label: context.l10n.continueBtnLabel,
              onTap: () => context.pushNamed(RouteNames.otpPage),
            ),
            SizedBox(height: 16.toResponsiveHeight(context)),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RotatedChip(
            name: context.l10n.contactDetails,
            chipColor: AppColors.yellow,
            actionIconColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8.4, horizontal: 13),
            textColor: Colors.white,
            labelStyle: context.textTheme.labelSmall,
            angle: pi / 50,
          ),
          SizedBox(height: 26.toResponsiveHeight(context)),
          Text(
            context.l10n.letsGetYouStarted,
            style: context.textTheme.headlineLarge!
                .withColor(Colors.black)
                .responsiveFont(context),
          ),
          SizedBox(height: 18.toResponsiveHeight(context)),
          Text(
            context.l10n.firstWeNeedPhone,
            style: context.textTheme.labelMedium!
                .withColor(AppColors.greyTextColor),
          ),
          SizedBox(height: 37.toResponsiveHeight(context)),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 14,
                  color: AppColors.black.withOpacity(0.1),
                )
              ],
            ),
            child: CurvedTextFormField(
              focusedBorderColor: AppColors.purpleText.withOpacity(0.5),
              textInputType: TextInputType.phone,
              controller: TextEditingController(),
              hint: context.l10n.phoneNumber,
              autofocus: true,
              prefix: Container(
                margin: const EdgeInsets.only(right: 13).responsive(context),
                child: Text(
                  '+91',
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
