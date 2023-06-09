import 'package:flutter/material.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/icon_header.dart';
import 'package:wizr/views/kyc/constants/employee_type_enum.dart';

class CustomEmployeeForm extends StatelessWidget {
  const CustomEmployeeForm({
    required this.employeeType,
    required this.child,
    super.key,
  });
  final EmployeeType employeeType;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (employeeType.title(context).isEmpty)
            const SizedBox()
          else
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16)
                  .responsive(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    employeeType.title(context),
                    style: context.textTheme.headlineSmall,
                  ),
                  IconHeader(iconPath: employeeType.assetIcon),
                ],
              ),
            ),
          SizedBox(height: 24.toResponsiveHeight(context)),
          Expanded(
            child: SizedBox(
              width: context.screenWidth,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
