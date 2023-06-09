// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/views/kyc/address/detect_location_sheet.dart';
import 'package:wizr/views/kyc/widgets/address_card.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycAddressSelectPage extends StatelessWidget {
  const KycAddressSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          height: 156.toResponsiveHeight(context),
          color: Colors.white,
          width: context.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 22.toResponsiveHeight(context)),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    builder: (_) => const DetectLocationSheet(),
                  );
                },
                child: Text(
                  context.l10n.cantFindAddressQuestion,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium!
                      .responsiveFont(context)
                      .withColor(AppColors.financeBlueLight),
                ),
              ),
              SizedBox(height: 26.toResponsiveHeight(context)),
              PrimaryButton(
                label: context.l10n.continueBtnLabel,
                onTap: () => context.pushNamed(RouteNames.uploadDigitallyPage),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.whereDoYouCurrentlyLive),
            SizedBox(
              height: 28.toResponsiveHeight(context),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16)
                  .responsive(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${context.l10n.addressFound} (05)',
                    style: context.textTheme.headlineSmall!
                        .responsiveFont(context),
                  ),
                  SizedBox(height: 16.toResponsiveHeight(context)),
                  Text(
                    context.l10n.addressFoundDesc,
                    style: context.textTheme.bodyMedium!
                        .responsiveFont(context)
                        .withColor(AppColors.tabColor),
                  ),
                  SizedBox(
                    height: 24.toResponsiveHeight(context),
                  ),
                  AddressCard(
                    title:
                        '1206,Address , LBS Road, Near Address hall, opp Address police station Address west, Mumbai - 400078',
                    onTap: () {
                      context.pushNamed(RouteNames.kycManualAddressPage);
                    },
                    bodyText: 'Source: CIBIL',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
