import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/theme_constants.dart';

import 'helpers/helpers.dart';

void main() {
  testWidgets('App start', (tester) async {
    await tester.pumpApp(
      MaterialApp(
        theme: darkTheme,
      ),
    );
  });

  test('Test to assert router configuration has "/" as initialLocation', () {
    expect(router.routeInformationProvider.value.location, '/');
  });
}
