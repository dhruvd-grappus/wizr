import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';

import 'package:wizr/views/kyc/widgets/form_field.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycManualAddressPage extends StatefulWidget {
  const KycManualAddressPage({super.key});

  @override
  State<KycManualAddressPage> createState() => _KycManualAddressPageState();
}

class _KycManualAddressPageState extends State<KycManualAddressPage> {
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
                      KycFormField(
                        controller: addressController,
                        label: context.l10n.enterFullAddress,
                      ),
                      KycFormField(
                        controller: landmarkController,
                        label: context.l10n.enterLandmark,
                      ),
                      KycFormField(
                        controller: cityController,
                        label: context.l10n.city,
                        isDropDown: true,
                      ),
                      KycFormField(
                        controller: pinCodeController,
                        label: context.l10n.pinCode,
                        textInputType: TextInputType.phone,
                      ),
                      KycFormField(
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
