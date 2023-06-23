part of 'go_router_config.dart';

final kycRoutes = [
  GoRoute(
    name: RouteNames.accountVerified,
    path: '/${RouteNames.accountVerified}',
    builder: (context, state) => const AccountVerifiedPage(),
  ),
  GoRoute(
    name: RouteNames.kycFaceScanPage,
    path: '/${RouteNames.kycFaceScanPage}',
    builder: (context, state) => KycFaceScanPage(),
  ),
  GoRoute(
    name: RouteNames.kycUploadPhotoPage,
    path: '/${RouteNames.kycUploadPhotoPage}',
    builder: (context, state) => const KycUploadPhotoPage(),
  ),
  GoRoute(
    name: RouteNames.kycUploadBankStatement,
    path: '/${RouteNames.kycUploadBankStatement}',
    builder: (context, state) => const KycUploadBankStatementPage(),
  ),
  GoRoute(
    name: RouteNames.kycUpdateBankPage,
    path: '/${RouteNames.kycUpdateBankPage}',
    builder: (context, state) => const KycUpdateBankPage(),
  ),
  GoRoute(
    name: RouteNames.kycSelectBankPage,
    path: '/${RouteNames.kycSelectBankPage}',
    builder: (context, state) => const KycSelectBankPage(),
  ),
  GoRoute(
    name: RouteNames.signupPage,
    path: '/${RouteNames.signupPage}',
    builder: (context, state) => const SignupPage(),
  ),
  GoRoute(
    name: RouteNames.otpPage,
    path: '/${RouteNames.otpPage}',
    builder: (context, state) => const OtpPage(),
  ),
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
    name: RouteNames.userProfessionPage,
    path: '/${RouteNames.userProfessionPage}',
    builder: (context, state) => const UserProfessionPage(),
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
  )
];
