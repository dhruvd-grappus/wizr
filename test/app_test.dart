import 'package:flutter_test/flutter_test.dart';
import 'package:wizr/app/app.dart';

import 'helpers/helpers.dart';

void main() {
  testWidgets('App start', (tester) async {
    await tester.pumpApp(const App());
  });
}
