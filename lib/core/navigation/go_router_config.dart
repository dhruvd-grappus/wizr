import 'package:go_router/go_router.dart';
import '../../views/kyc/kyc_address_page.dart';

class RouteNames {
  static const kycAddressPage = 'kyc-address';
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.kycAddressPage,
      path: '/',
      builder: (context, state) => const KycAddressPage(),
    ),
  ],
);
