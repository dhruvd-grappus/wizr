import 'package:go_router/go_router.dart';
import 'package:wizr/views/kyc/address/kyc_address_select_page.dart';
import 'package:wizr/views/kyc/address/kyc_home_type_page.dart';
import 'package:wizr/views/kyc/address/kyc_manual_address_page.dart';
import 'package:wizr/views/kyc/employee/kyc_employee_page.dart';

class RouteNames {
  static const kycManualAddressPage = 'kyc-manual-address';
  static const kycEmployeePage = 'kyc-employee';
  static const kycHomeTypePage = 'kyc-home-type';
  static const kycAddressSelectPage = 'kyc-address-select';
}

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/${RouteNames.kycHomeTypePage}',
  routes: [
    GoRoute(
      name: RouteNames.kycManualAddressPage,
      path: '/${RouteNames.kycManualAddressPage}',
      builder: (context, state) => const KycManualAddressPage(),
    ),
    GoRoute(
      name: RouteNames.kycAddressSelectPage,
      path: '/${RouteNames.kycAddressSelectPage}',
      builder: (context, state) => const KycAddressSelectPage(),
    ),
    GoRoute(
      name: RouteNames.kycHomeTypePage,
      path: '/${RouteNames.kycHomeTypePage}',
      builder: (context, state) => KycHomeTypePage(),
    ),
    GoRoute(
      name: RouteNames.kycEmployeePage,
      path: '/',
      builder: (context, state) => KycEmployeePage(),
    ),
  ],
);
