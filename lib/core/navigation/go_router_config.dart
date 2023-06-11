import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/views/authentication/phone_login_page.dart';
import 'package:wizr/views/finance/finance_page.dart';
import 'package:wizr/views/home_page.dart';
import 'package:wizr/views/kyc/address/kyc_address_select_page.dart';
import 'package:wizr/views/kyc/address/kyc_home_type_page.dart';
import 'package:wizr/views/kyc/address/kyc_manual_address_page.dart';
import 'package:wizr/views/kyc/address/search_location_page.dart';
import 'package:wizr/views/kyc/employee/kyc_employee_page.dart';
import 'package:wizr/views/kyc/identity/kyc_identity_proof_page.dart';
import 'package:wizr/views/kyc/identity/kyc_upload_aadhar_page.dart';
import 'package:wizr/views/kyc/identity/kyc_upload_digitally_page.dart';
import 'package:wizr/views/landing/landing_page.dart';
import 'package:wizr/views/widgets/under_development.dart';

// Keys
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class RouteNames {
  static const kycManualAddressPage = 'kyc-manual-address';
  static const kycEmployeePage = 'kyc-employee';
  static const kycHomeTypePage = 'kyc-home-type';
  static const kycAddressSelectPage = 'kyc-address-select';
  static const searchLocationPage = 'search-location-map';
  static const uploadDigitallyPage = 'kyc-upload-digitally';
  static const uploadAadharPage = 'kyc-upload-aadhar';
  static const kycIdentityProof = 'kyc-identity-proof';
  static const baseHome = 'base-home';
  static const discoverPage = 'discover';
  static const learnPage = 'learn';
  static const landingPage = 'home';
  static const financePage = 'finance';
  static const growPage = 'grow';
  static const financeHomePage = 'finance-homepage';
  static const phoneLoginPage = 'phone-login';
}

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: RouteNames.phoneLoginPage,
      path: '/${RouteNames.phoneLoginPage}',
      builder: (context, state) => const PhoneLoginPage(),
    ),
    GoRoute(
      name: RouteNames.kycIdentityProof,
      path: '/${RouteNames.kycIdentityProof}',
      builder: (context, state) => const KycIdentityProofPage(),
    ),
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
      path: '/${RouteNames.kycEmployeePage}',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (_, __) => CustomTransitionPage(
        child: const KycEmployeePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (_, __, child) {
        return HomePage(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          name: RouteNames.discoverPage,
          path: '/${RouteNames.discoverPage}',
          pageBuilder: (_, __) => CustomTransitionPage(
            child: const UnderDevelopment(name: 'Discover'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0, 1);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        ),
        GoRoute(
          name: RouteNames.learnPage,
          path: '/${RouteNames.learnPage}',
          pageBuilder: (_, __) => CustomTransitionPage(
            child: const UnderDevelopment(name: 'Learn'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0, 1);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        ),
        GoRoute(
          name: RouteNames.landingPage,
          path: '/',
          pageBuilder: (_, __) => CustomTransitionPage(
            child: const LandingPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0, 1);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        ),
        GoRoute(
          name: RouteNames.financePage,
          path: '/${RouteNames.financePage}',
          pageBuilder: (_, __) => CustomTransitionPage(
            child: const FinancePage(), //const KycEmployeePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0, 1);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        ),
        GoRoute(
          name: RouteNames.growPage,
          path: '/${RouteNames.growPage}',
          pageBuilder: (_, __) => CustomTransitionPage(
            child: const UnderDevelopment(name: 'Grow'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0, 1);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        ),
      ],
    ),
    /*GoRoute(
      name: RouteNames.financeHomePage,
      path: '/',
      builder: (context, state) => const FinancePage(),
    ),*/
  ],
);

/// For Left to Right transition chnage offset
/// transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               const begin = Offset(1.0, 0.0);
//               const end = Offset.zero;
//               const curve = Curves.ease;
//
//               var tween =
//               Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//               return SlideTransition(
//                 position: animation.drive(tween),
//                 child: child,
//               );
//             },
//               transitionDuration: const Duration(milliseconds: 600)
