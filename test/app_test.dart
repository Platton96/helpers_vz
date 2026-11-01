import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_vz/app.dart';

import 'helpers/test_app.dart';

void main() {
  setUpTestApp();

  testWidgets('shows Russian text even when the device locale is English', (tester) async {
    tester.platformDispatcher.localesTestValue = const [Locale('en')];
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const HelpersApp());
    await tester.pumpAndSettle();

    expect(find.text(russianStrings.homeSubtitle), findsOneWidget);
    expect(find.text(russianStrings.homeMathSquareButton), findsOneWidget);
  });
}
