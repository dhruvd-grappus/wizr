import 'package:flutter/material.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/views/kyc/employee/utils/employee_type_enum.dart';
import 'package:wizr/views/kyc/widgets/kyc_card.dart';

class EmployeeTypeSelectorWidget extends StatelessWidget {
  const EmployeeTypeSelectorWidget({required this.pageController, super.key});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16).responsive(context),
      child: Column(
        children: [
          Column(
            children: [EmployeeType.salaried, EmployeeType.self]
                .map(
                  (employeeType) => employeeType == EmployeeType.unselected
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.only(bottom: 16)
                              .responsive(context),
                          child: KycCard(
                            height: 137.toResponsiveHeight(context),
                            bodyText: employeeType.description(context),
                            iconPath: employeeType.assetIcon,
                            title: employeeType.title(context),
                            onTap: () {
                              pageController.jumpToPage(
                                employeeType.pageIndex,
                              );
                            },
                          ),
                        ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [EmployeeType.retired, EmployeeType.student]
                .map(
                  (employeeType) => employeeType == EmployeeType.unselected
                      ? const SizedBox()
                      : KycCard(
                          height: 213.toResponsiveHeight(context),
                          isHalfCard: true,
                          bodyText: employeeType.description(context),
                          iconPath: employeeType.assetIcon,
                          title: employeeType.title(context),
                          onTap: () {
                            pageController.jumpToPage(
                              employeeType.pageIndex,
                            );
                          },
                        ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
