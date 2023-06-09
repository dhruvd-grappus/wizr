import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/form_fields.dart';
import 'package:wizr/core/widgets/app_checkbox.dart';
import 'package:wizr/core/widgets/tab_header.dart';
import 'package:wizr/views/kyc/widgets/address_card.dart';
import 'package:wizr/views/kyc/widgets/document_upload_section.dart';
import 'package:wizr/views/kyc/widgets/kyc_card.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycAddressPage extends StatefulWidget {
  const KycAddressPage({super.key});

  @override
  State<KycAddressPage> createState() => _KycAddressPageState();
}

class _KycAddressPageState extends State<KycAddressPage> {
  final addressController = TextEditingController();

  final landmarkController = TextEditingController();

  final cityController = TextEditingController();

  final pinCodeController = TextEditingController();

  final stateController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        bottomSheet: Container(
          color: Colors.white,
          width: context.screenWidth,
          child: PrimaryButton(label: context.l10n.confirm),
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.kycAddressHeader),
            SizedBox(
              height: 28.toResponsiveHeight(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .responsive(context),
              child: Text(
                context.l10n.addAddress,
                textAlign: TextAlign.left,
                style: context.textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 24.toResponsiveHeight(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .responsive(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CustomAddressFormField(
                        controller: addressController,
                        label: context.l10n.enterFullAddress,
                      ),
                      _CustomAddressFormField(
                        controller: landmarkController,
                        label: context.l10n.enterLandmark,
                      ),
                      _CustomAddressFormField(
                        controller: cityController,
                        label: context.l10n.city,
                        isDropDown: true,
                      ),
                      _CustomAddressFormField(
                        controller: pinCodeController,
                        label: context.l10n.pinCode,
                        textInputType: TextInputType.phone,
                      ),
                      _CustomAddressFormField(
                        controller: stateController,
                        label: context.l10n.state,
                        isDropDown: true,
                      ),
                      const SizedBox(
                        height: 100,
                      )
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

class _CustomAddressFormField extends StatelessWidget {
  const _CustomAddressFormField({
    required this.controller,
    required this.label,
    this.isDropDown = false,
    this.textInputType = TextInputType.streetAddress,
  });
  final TextEditingController controller;
  final String label;
  final bool isDropDown;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24).responsive(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: context.textTheme.labelSmall!.responsiveFont(context),
              ),
              Text(
                '*',
                style:
                    context.textTheme.labelSmall!.copyWith(color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 12.toResponsiveHeight(context),
          ),
          if (isDropDown)
            const CurvedDropdownField()
          else
            const CurvedFormField(),
        ],
      ),
    );
  }
}
