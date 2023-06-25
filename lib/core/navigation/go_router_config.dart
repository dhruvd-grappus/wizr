import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/slide_transition_page.dart';
import 'package:wizr/views/authentication/otp_page.dart';
import 'package:wizr/views/authentication/phone_login_page.dart';
import 'package:wizr/views/authentication/signup_page.dart';
import 'package:wizr/views/authentication/user_profession.dart';
import 'package:wizr/views/course_recommendations/course_recommendations_page.dart';
import 'package:wizr/views/finance/finance_page.dart';
import 'package:wizr/views/home_page.dart';
import 'package:wizr/views/kyc/account_verified_page.dart';
import 'package:wizr/views/kyc/address/kyc_address_select_page.dart';
import 'package:wizr/views/kyc/address/kyc_home_type_page.dart';
import 'package:wizr/views/kyc/address/kyc_manual_address_page.dart';
import 'package:wizr/views/kyc/address/search_location_page.dart';
import 'package:wizr/views/kyc/bank/kyc_select_bank_page.dart';
import 'package:wizr/views/kyc/bank/kyc_update_bank_page.dart';
import 'package:wizr/views/kyc/bank/kyc_upload_bank_statement_page.dart';
import 'package:wizr/views/kyc/employee/kyc_employee_page.dart';
import 'package:wizr/views/kyc/face/kyc_face_scan_page.dart';
import 'package:wizr/views/kyc/face/kyc_upload_photo_page.dart';
import 'package:wizr/views/kyc/identity/kyc_identity_proof_page.dart';
import 'package:wizr/views/kyc/identity/kyc_upload_aadhar_page.dart';
import 'package:wizr/views/kyc/identity/kyc_upload_digitally_page.dart';
import 'package:wizr/views/landing/landing_page.dart';
import 'package:wizr/views/learn/learn_page.dart';
import 'package:wizr/views/widgets/under_development.dart';
part 'course_recommendation_shell_route.dart';
part 'dashboard_shell_route.dart';
part 'kyc_routes.dart';

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
  static const learn2Page = 'learn2';
  static const landingPage = 'home';
  static const financePage = 'finance';
  static const growPage = 'grow';
  static const financeHomePage = 'finance-homepage';
  static const phoneLoginPage = 'phone-login';
  static const otpPage = 'otp-page';
  static const signupPage = 'signup-page';
  static const userProfessionPage = 'user-profession-page';
  static const kycSelectBankPage = 'kyc-select-bank';
  static const kycUpdateBankPage = 'kyc-update-bank';
  static const kycUploadBankStatement = 'kyc-upload-bank-statement';
  static const accountVerified = 'account-verified';
  static const kycUploadPhotoPage = 'kyc-upload-photo';
  static const kycFaceScanPage = 'kyc-face-scan';
  static const courseRecommendationPage = 'course-recommendation';
  static const chooseSubjectPage = 'choose-subject';
  static const pickSkillPage = 'pick-skill';
  static const comfortLevelPage = 'comfort-level';
  static const preferredLearningModePage = 'preferred-learning-mode';
  static const spendTimeForLearningPage = 'spend-time-for-learning';
  static const courseQuizCompletedPage = 'course-quiz-completed';
}

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    ...kycRoutes,
    dashboardShellRoute,
    courseRecommendationShellRoute,
    GoRoute(
      name: RouteNames.learnPage,
      path: '/${RouteNames.learnPage}',
      pageBuilder: (_, __) => CustomTransitionPage(
        child: LearnPage(),
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
          parentNavigatorKey: _shellNavigatorKey,
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
          name: RouteNames.learn2Page,
          path: '/${RouteNames.learn2Page}',
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
