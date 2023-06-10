import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/views/kyc/constants/employee_type_enum.dart';
import 'package:wizr/views/kyc/employee/widgets/custom_employee_form.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycEmployeePage extends StatefulWidget {
  const KycEmployeePage({super.key});

  @override
  State<KycEmployeePage> createState() => _KycEmployeePageState();
}

class _KycEmployeePageState extends State<KycEmployeePage> {
  final PageController pageController = PageController();
  final ValueNotifier<bool> isLastPage = ValueNotifier(false);
  Future<bool> goToPreviousPage() async {
    if (pageController.hasClients) {
      if ((pageController.page ?? 0) >= 1) {
        pageController.jumpToPage(
          0,
        );
        return false;
      } else {
        context.pop();
        return true;
      }
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (pageController.hasClients) {
        isLastPage.value = (pageController.page ?? 0) >= 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: goToPreviousPage,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: isLastPage,
              builder: (_, isLastPage, child) {
                return KycHeaderWithTitle(
                  title: isLastPage
                      ? context.l10n.borrowerDetails
                      : context.l10n.kycEmployeeStatus,
                  onBack: goToPreviousPage,
                );
              },
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
    );
  }
}
