import 'package:flutter/material.dart';
import 'package:wizr/l10n/l10n.dart';
import 'package:wizr/navigation/go_router_config.dart';
import 'package:wizr/theme/theme_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
