import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/views/kyc/widgets/kyc_card.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycUploadDigitallyPage extends StatelessWidget {
  const KycUploadDigitallyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.uploadDigitally),
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
                      context.l10n.aadharKYC,
                      style: context.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 16.toResponsiveHeight(context)),
                    SizedBox(
                      width: 296.toResponsiveWidth(context),
                      child: Text(
                        context.l10n.aadharKYCDesc,
                        maxLines: 2,
                        style: context.textTheme.bodyMedium!
                            .responsiveFont(context)
                            .withColor(AppColors.financeBlueDark)
                            .withOpacity(0.72),
                      ),
                    ),
                    SizedBox(height: 32.toResponsiveHeight(context)),
                    Text(
                      context.l10n.onClickContinue,
                      style: context.textTheme.bodyMedium!
                          .responsiveFont(context)
                          .withColor(AppColors.midnightBlack),
                    ),
                    SizedBox(height: 26.toResponsiveHeight(context)),
                    KycCard(
                      title: context.l10n.enterAadharNumber,
                      iconPath: '',
                      cardType: KycCardType.timeLineCard,
                      onTap: () {
                        // TODO(dhruv): on tap
                      },
                      bodyText: 'Lorem ipsum dolor sit ',
                    ),
                    SizedBox(height: 24.toResponsiveHeight(context)),
                    KycCard(
                      title: context.l10n.enterOTPSentToAadhar,
                      iconPath: '',
                      cardType: KycCardType.timeLineCard,
                      onTap: () {
                        // TODO(dhruv): on tap
                      },
                      bodyText: 'Lorem ipsum dolor sit ',
                    ),
                    Expanded(child: Container()),
                    PrimaryButton(
                      label: context.l10n.confirm,
                      margin: EdgeInsets.zero,
                      onTap: () =>
                          context.pushNamed(RouteNames.uploadAadharPage),
                      //     height: 52.toResponsiveHeight(context),
                    ),
                    SizedBox(height: 28.toResponsiveHeight(context)),
                    Align(
                      child: Text(
                        context.l10n.aadharNotLinkedQues,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!
                            .withColor(AppColors.financeBlueLight),
                      ),
                    ),
                    SizedBox(height: 26.toResponsiveHeight(context)),
                    Align(
                      child: Text(
                        context.l10n.dontHaveAadharQues,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!
                            .withColor(AppColors.financeBlueLight),
                      ),
                    ),
                    SizedBox(height: 28.toResponsiveHeight(context)),
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
