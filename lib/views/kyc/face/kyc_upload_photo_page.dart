import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';
import 'package:wizr/views/kyc/face/widgets/selfie_instructions_sheet.dart';
import 'package:wizr/views/kyc/models/timeline_step.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';
import 'package:wizr/views/kyc/widgets/timeline_steps_widget.dart';

class KycUploadPhotoPage extends StatelessWidget {
  const KycUploadPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.justOneMoreMinuteToBeIn),
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
                      context.l10n.forVerification,
                      style: context.textTheme.bodyMedium!
                          .responsiveFont(context)
                          .withColor(AppColors.midnightBlack),
                    ),
                    SizedBox(height: 26.toResponsiveHeight(context)),
                    TimelineStepsWidget(
                      steps: [
                        TimelineStep(
                          stepNumber: 1,
                          title: context.l10n.clickASelfie,
                          subtitle: context.l10n.stepIntoAWellLitArea,
                        ),
                        TimelineStep(
                          stepNumber: 2,
                          title: context.l10n.keepYourIDReady,
                          subtitle: context.l10n.youWillUploadAadhar,
                        ),
                        TimelineStep(
                          stepNumber: 3,
                          title: context.l10n.panCard,
                          subtitle: context.l10n.youWillUploadPan,
                        )
                      ],
                    ),
                    SizedBox(height: 26.toResponsiveHeight(context)),
                    Expanded(child: Container()),
                    PrimaryButton(
                      label: context.l10n.continueBtnLabel,
                      margin: EdgeInsets.zero,
                      onTap: () => showRoundedBottomSheet(
                        context,
                        const SelfieInstructionsSheet(),
                      ).then(
                        (value) =>
                            context.pushNamed(RouteNames.kycFaceScanPage),
                      ),
                      //     height: 52.toResponsiveHeight(context),
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
