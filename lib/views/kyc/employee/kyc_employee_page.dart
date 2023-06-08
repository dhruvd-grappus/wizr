import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/views/kyc/employee/utils/employee_type_enum.dart';
import 'package:wizr/views/kyc/employee/widgets/custom_employee_form.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycEmployeePage extends StatelessWidget {
  KycEmployeePage({super.key});
  final PageController pageController = PageController();
  Future<bool> goToPreviousPage() async {
    if (pageController.hasClients) {
      if ((pageController.page ?? 0) >= 1) {
        pageController.jumpToPage(
          0,
        );
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: goToPreviousPage,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.offWhiteBackground,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KycHeaderWithTitle(
                title: context.l10n.kycEmployeeStatus,
                onBack: goToPreviousPage,
              ),
              SizedBox(height: 28.toResponsiveHeight(context)),
              Expanded(
                child: SizedBox(
                  width: context.screenWidth,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: EmployeeType.values.length,
                    controller: pageController,
                    itemBuilder: (_, index) {
                      final type = EmployeeType.values[index];
                      return CustomEmployeeForm(
                        employeeType: type,
                        child: type.pageContent(pageController),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
