import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/views/kyc/widgets/form_field.dart';

class SalariedEmployeeForm extends StatelessWidget {
  SalariedEmployeeForm({super.key});
  final TextEditingController monthlyIncome = TextEditingController();
  final TextEditingController company = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        bottomSheet: Container(
          color: Colors.white,
          width: context.screenWidth,
          child: PrimaryButton(
            label: context.l10n.continueBtnLabel,
            active: false,
            onTap: () => context.push('/${RouteNames.kycUploadPhotoPage}'),
          ),
        ),
        backgroundColor: AppColors.offWhiteBackground,
        body: Container(
          margin:
              const EdgeInsets.symmetric(horizontal: 16).responsive(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              KycFormField(
                controller: monthlyIncome,
                label: context.l10n.monthlyIncome,
              ),
              KycFormField(
                controller: company,
                label: context.l10n.company,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
