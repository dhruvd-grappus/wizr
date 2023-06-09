import 'package:flutter/material.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/views/kyc/employee/widgets/employee_type_selector_widget.dart';
import 'package:wizr/views/kyc/employee/widgets/retired_form.dart';
import 'package:wizr/views/kyc/employee/widgets/salaried_employee_form.dart';
import 'package:wizr/views/kyc/employee/widgets/self_employed.dart';
import 'package:wizr/views/kyc/employee/widgets/student_form.dart';

enum EmployeeType {
  unselected(0, ''),
  salaried(1, AssetIcons.salaried),
  self(2, AssetIcons.self),
  retired(3, AssetIcons.retired),
  student(4, AssetIcons.student);

  const EmployeeType(this.pageIndex, this.assetIcon);
  final int pageIndex;
  final String assetIcon;
}

extension EUtil on EmployeeType {
  String title(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case EmployeeType.unselected:
        return '';
      case EmployeeType.salaried:
        return l10n.salaried;
      case EmployeeType.self:
        return l10n.selfEmployed;

      case EmployeeType.retired:
        return l10n.retired;
      case EmployeeType.student:
        return l10n.student;
    }
  }

  String description(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case EmployeeType.unselected:
        return '';
      case EmployeeType.salaried:
        return l10n.salariedDescription;
      case EmployeeType.self:
        return l10n.selfEmployedDescription;

      case EmployeeType.retired:
        return l10n.retiredDescription;
      case EmployeeType.student:
        return l10n.studentDescription;
    }
  }

  Widget pageContent(PageController controller) {
    switch (this) {
      case EmployeeType.unselected:
        return EmployeeTypeSelectorWidget(
          pageController: controller,
        );
      case EmployeeType.salaried:
        return SalariedEmployeeForm();
      case EmployeeType.self:
        return SelfEmployed();
      case EmployeeType.retired:
        return RetiredForm();
      case EmployeeType.student:
        return StudentForm();
    }
  }
}
