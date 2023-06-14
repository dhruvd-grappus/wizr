import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/icon_header.dart';
import 'package:wizr/core/widgets/tab_header.dart';
import 'package:wizr/views/kyc/bank/constants/bank_proof_enum.dart';
import 'package:wizr/views/kyc/widgets/document_upload_section.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycUploadBankStatementPage extends StatefulWidget {
  const KycUploadBankStatementPage({super.key});

  @override
  State<KycUploadBankStatementPage> createState() =>
      _KycUploadBankStatementPageState();
}

class _KycUploadBankStatementPageState
    extends State<KycUploadBankStatementPage> {
  BankProofType selectedProof = BankProofType.cancelledCheque;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.uploadBankStatement),
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
                      context.l10n.uploadAnyOfTheseDocs,
                      style: context.textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 24.toResponsiveHeight(context),
                    ),
                    TabHeader(
                      fontSize: 12,
                      tabTiles: BankProofType.values
                          .map((e) => e.title(context))
                          .toList(),
                      width: context.screenWidth - 20,
                      onChanged: log,
                    ),
                    Expanded(
                      child: _BankProofUploadForm(bankProofType: selectedProof),
                    ),
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

class _BankProofUploadForm extends StatelessWidget {
  const _BankProofUploadForm({
    required this.bankProofType,
  });
  final BankProofType bankProofType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.toResponsiveHeight(context)),
        DocumentUploadCard(
          isDocument: true,
          title: bankProofType.tabToUploadDesc(context),
          onSelectedPath: (_) {
            // TODO(dhruv): path
          },
        ),
        SizedBox(height: 32.toResponsiveHeight(context)),
        const _UploadedFile(),
        Expanded(child: Container()),
        PrimaryButton(
          label: context.l10n.confirm,
          margin: EdgeInsets.zero,
          onTap: () => context.pushNamed(RouteNames.accountVerified),
          //     height: 52.toResponsiveHeight(context),
        ),
        SizedBox(height: 28.toResponsiveHeight(context)),
      ],
    );
  }
}

class _UploadedFile extends StatelessWidget {
  const _UploadedFile();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      constraints: BoxConstraints(maxHeight: 70.toResponsiveHeight(context)),
      padding: const EdgeInsets.all(16).responsive(context),
      child: Row(
        children: [
          const IconHeader(iconPath: AssetIcons.pdf),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aug_statement.pdf',
                style: context.textTheme.labelLarge!
                    .withColor(Colors.black)
                    .responsiveFont(context),
              ),
              Expanded(child: Container()),
              Text(
                '100kb',
                style: context.textTheme.labelMedium!
                    .withColor(AppColors.midnightBlack.withOpacity(0.72))
                    .responsiveFont(context),
              ),
            ],
          ),
          Expanded(child: Container()),
          SvgPicture.asset(
            AssetIcons.checkGreen,
            width: 21.toResponsiveWidth(context),
          ),
          SizedBox(width: 14.toResponsiveWidth(context)),
          SvgPicture.asset(
            AssetIcons.closeBlack,
            width: 21.toResponsiveWidth(context),
            // ignore: deprecated_member_use
          )
        ],
      ),
    );
  }
}
