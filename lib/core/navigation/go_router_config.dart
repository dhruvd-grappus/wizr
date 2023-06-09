import 'package:go_router/go_router.dart';
import 'package:wizr/views/kyc/address/kyc_address_select_page.dart';
import 'package:wizr/views/kyc/address/kyc_home_type_page.dart';
import 'package:wizr/views/kyc/address/kyc_manual_address_page.dart';
import 'package:wizr/views/kyc/address/search_location_page.dart';
import 'package:wizr/views/kyc/employee/kyc_employee_page.dart';
import 'package:wizr/views/kyc/identity/kyc_upload_aadhar_page.dart';
import 'package:wizr/views/kyc/identity/kyc_upload_digitally_page.dart';

class RouteNames {
  static const kycManualAddressPage = 'kyc-manual-address';
  static const kycEmployeePage = 'kyc-employee';
  static const kycHomeTypePage = 'kyc-home-type';
  static const kycAddressSelectPage = 'kyc-address-select';
  static const searchLocationPage = 'search-location-map';
  static const uploadDigitallyPage = 'kyc-upload-digitally';
  static const uploadAadharPage = 'kyc-upload-aadhar';
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.uploadAadharPage,
      path: '/${RouteNames.uploadAadharPage}',
      builder: (context, state) => const KycUploadAadharPage(),
    ),
    GoRoute(
      name: RouteNames.uploadDigitallyPage,
      path: '/${RouteNames.uploadDigitallyPage}',
      builder: (context, state) => const KycUploadDigitallyPage(),
    ),
    GoRoute(
      name: RouteNames.searchLocationPage,
      path: '/${RouteNames.searchLocationPage}',
      builder: (context, state) => const SearchLocationPage(),
    ),
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
      builder: (context, state) => const KycEmployeePage(),
    ),
  ],
);
