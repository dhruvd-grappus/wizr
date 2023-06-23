part of 'go_router_config.dart';

final ShellRoute courseRecommendationShellRoute = ShellRoute(
  builder: (_, __, child) {
    return CourseRecommendationsPage(child: child);
  },
  routes: <RouteBase>[
    GoRoute(
      name: RouteNames.chooseSubjectPage,
      path: '/${RouteNames.chooseSubjectPage}',
      pageBuilder: (_, __) => CustomTransitionPage(
        child: const ChooseSubjectPage(), //const KycEmployeePage(),
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
    GoRoute(
      name: RouteNames.pickSkillPage,
      path: '/${RouteNames.pickSkillPage}',
      pageBuilder: (_, __) => CustomTransitionPage(
        child: const PickSkillPage(), //const KycEmployeePage(),
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
    GoRoute(
      name: RouteNames.comfortLevelPage,
      path: '/${RouteNames.comfortLevelPage}',
      pageBuilder: (_, __) => CustomTransitionPage(
        child: const ComfortLevelPage(), //const KycEmployeePage(),
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
    GoRoute(
      name: RouteNames.preferredLearningModePage,
      path: '/${RouteNames.preferredLearningModePage}',
      pageBuilder: (_, __) => CustomTransitionPage(
        child: const PreferredLearningModePage(),
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
    GoRoute(
      name: RouteNames.spendTimeForLearningPage,
      path: '/${RouteNames.spendTimeForLearningPage}',
      pageBuilder: (_, state) => CustomTransitionPage(
        child: SpendTimeForLearningPage(
          modeOfLearning: state.queryParameters['mode']!,
        ),
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
    GoRoute(
      name: RouteNames.courseQuizCompletedPage,
      path: '/${RouteNames.courseQuizCompletedPage}',
      pageBuilder: (context, state) =>
          horizontalSlideTransitionPage(const CourseQuizCompletedPage()),
    )
  ],
);
