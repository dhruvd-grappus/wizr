part of 'go_router_config.dart';

final ShellRoute dashboardShellRoute = ShellRoute(
  navigatorKey: _shellNavigatorKey,
  builder: (_, __, child) {
    return HomePage(child: child);
  },
  routes: <RouteBase>[
    GoRoute(
      name: RouteNames.discoverPage,
      path: '/${RouteNames.discoverPage}',
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (_, __) =>
          verticalSlideTransitionPage(const UnderDevelopment(name: 'Discover')),
    ),
    GoRoute(
      name: RouteNames.learn2Page,
      path: '/${RouteNames.learn2Page}',
      pageBuilder: (_, __) => CustomTransitionPage(
        child: const UnderDevelopment(name: 'Learn'),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
);
