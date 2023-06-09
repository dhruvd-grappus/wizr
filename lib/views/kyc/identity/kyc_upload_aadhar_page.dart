import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/tab_header.dart';
import 'package:wizr/views/kyc/widgets/document_upload_section.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycUploadAadharPage extends StatelessWidget {
  const KycUploadAadharPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.aadharUpload),
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
                      context.l10n.uploadYourAadharCard,
                      style: context.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 16.toResponsiveHeight(context)),
                    SizedBox(
                      width: 296.toResponsiveWidth(context),
                      child: Text(
                        context.l10n.fileSpecs,
                        maxLines: 2,
                        style: context.textTheme.bodyMedium!
                            .responsiveFont(context)
                            .withColor(AppColors.tabColor)
                            .withOpacity(0.72),
                      ),
                    ),
                    SizedBox(height: 28.toResponsiveHeight(context)),
                    DocumentUploadCard(
                      title: context.l10n.tapToUploadDoc('Aadhar'),
                      onSelectedPath: (_) {
                        // TODO(dhruv): path
                      },
                    ),
                    SizedBox(height: 28.toResponsiveHeight(context)),
                    Align(
                      child: TabHeader(
                        tabTiles: [context.l10n.front, context.l10n.back],
                        width: 200.toResponsiveWidth(context),
                        onChanged: log,
                      ),
                    ),
                    Expanded(child: Container()),
                    PrimaryButton(
                      label: context.l10n.confirm,
                      margin: EdgeInsets.zero,
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
