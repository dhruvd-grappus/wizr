import 'package:go_router/go_router.dart';
import 'package:wizr/views/kyc/employee/kyc_employee_page.dart';
import 'package:wizr/views/kyc/kyc_address_page.dart';

class RouteNames {
  static const kycAddressPage = 'kyc-address';
  static const kycEmployeePage = 'kyc-employee';
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.kycAddressPage,
      path: '/${RouteNames.kycAddressPage}',
      builder: (context, state) => const KycAddressPage(),
    ),
    GoRoute(
      name: RouteNames.kycEmployeePage,
      path: '/',
      builder: (context, state) => KycEmployeePage(),
    ),
  ],
);
