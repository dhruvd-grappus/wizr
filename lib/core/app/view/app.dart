import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/theme_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (_, __) => MaterialApp.router(
          theme: darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    );
  }
}
