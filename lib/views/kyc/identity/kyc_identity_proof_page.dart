import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/tab_header.dart';
import 'package:wizr/views/kyc/identity/constants/identity_enums.dart';
import 'package:wizr/views/kyc/identity/widgets/identity_option_card.dart';
import 'package:wizr/views/kyc/widgets/document_upload_section.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycIdentityProofPage extends StatefulWidget {
  const KycIdentityProofPage({super.key});

  @override
  State<KycIdentityProofPage> createState() => _KycIdentityProofPageState();
}

class _KycIdentityProofPageState extends State<KycIdentityProofPage> {
  IdentityProofType selectedProof = IdentityProofType.drivingLicense;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.identityProof),
            SizedBox(
              height: 28.toResponsiveHeight(context),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16).responsive(context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: IdentityProofType.values
                        .map(
                          (e) => IdentityOptionCard(
                            title: e.title(context),
                            iconPath: e.icon,
                            isSelected: selectedProof.name == e.name,
                            onTap: () {
                              setState(() {
                                selectedProof = e;
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  //  const IdentityProofUploadForm(),
                ],
              ),
            ),
            SizedBox(
              height: 32.toResponsiveHeight(context),
            ),
            Expanded(
              child: IdentityProofUploadForm(identityProofType: selectedProof),
            )
          ],
        ),
      ),
    );
  }
}

class IdentityProofUploadForm extends StatelessWidget {
  const IdentityProofUploadForm({
    required this.identityProofType,
    super.key,
  });
  final IdentityProofType identityProofType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16).responsive(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            identityProofType.description(context),
            style: context.textTheme.headlineSmall,
          ),
          SizedBox(height: 12.toResponsiveHeight(context)),
          SizedBox(
            width: 296.toResponsiveWidth(context),
            child: Text(
              context.l10n.fileSpecs,
              maxLines: 2,
              style: context.textTheme.bodyMedium!
                  .responsiveFont(context)
                  .withColor(AppColors.financeBlueDark)
                  .withOpacity(0.72),
            ),
          ),
          SizedBox(height: 28.toResponsiveHeight(context)),
          DocumentUploadCard(
            title: identityProofType.tabToUploadDesc(context),
            onSelectedPath: (_) {
              // TODO(dhruv): path
            },
          ),
          SizedBox(height: 28.toResponsiveHeight(context)),
          Align(
            child: TabHeader(
              tabTiles: [context.l10n.front, context.l10n.back],
              width: 240.toResponsiveWidth(context),
              onChanged: log,
            ),
          ),
          Expanded(child: Container()),
          PrimaryButton(
            label: context.l10n.confirm,
            margin: EdgeInsets.zero,
            onTap: () => context.pushNamed(RouteNames.kycSelectBankPage),
            //     height: 52.toResponsiveHeight(context),
          ),
          SizedBox(height: 28.toResponsiveHeight(context)),
        ],
      ),
    );
  }
}
