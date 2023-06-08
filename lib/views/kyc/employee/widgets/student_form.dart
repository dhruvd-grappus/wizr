import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/views/kyc/widgets/form_field.dart';

class StudentForm extends StatelessWidget {
  StudentForm({super.key});
  final TextEditingController monthlyIncome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        width: context.screenWidth,
        child: PrimaryButton(
          label: context.l10n.confirm,
          active: false,
        ),
      ),
      backgroundColor: AppColors.offWhiteBackground,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16).responsive(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              KycFormField(
                controller: monthlyIncome,
                label: context.l10n.enterFirstName,
              ),
              KycFormField(
                controller: monthlyIncome,
                label: context.l10n.enterLastName,
              ),
              KycFormField(
                controller: monthlyIncome,
                label: context.l10n.borrowerRelation,
                isDropDown: true,
              ),
              KycFormField(
                controller: monthlyIncome,
                label: context.l10n.mobileNumber,
              ),
              KycFormField(
                controller: monthlyIncome,
                label: '${context.l10n.emailID} (${context.l10n.optional})',
              ),
              KycFormField(
                controller: monthlyIncome,
                label: '${context.l10n.pan} (${context.l10n.optional})',
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
