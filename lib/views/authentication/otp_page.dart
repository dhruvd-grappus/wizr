import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/views/authentication/widgets/custom_signup_flow_page.dart';
import 'package:wizr/views/widgets/rotated_chip.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
              onTap: () => context.pushNamed(RouteNames.kycEmployeePage),
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
            context.l10n.weSentYouAnOtp,
            style: context.textTheme.headlineLarge!.withColor(Colors.black),
          ),
          SizedBox(height: 18.toResponsiveHeight(context)),
          Row(
            children: [
              Text(
                context.l10n.onYourPhone,
                style: context.textTheme.labelMedium!
                    .withColor(AppColors.greyTextColor),
              ),
              Text(
                ' +91 8637251817',
                style: context.textTheme.labelMedium!
                    .withColor(AppColors.black)
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
          SizedBox(height: 37.toResponsiveHeight(context)),
          Pinput(
            length: 6,
            autofocus: true,
            defaultPinTheme: PinTheme(
              height: 52.toResponsiveHeight(context),
              width: 50.toResponsiveWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.lightGrey2.withOpacity(0.1),
              ),
            ),
          ),
          SizedBox(height: 17.toResponsiveHeight(context)),
          Text(
            'Resend OTP in 00:30 seconds',
            style: context.textTheme.labelMedium!.black
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
