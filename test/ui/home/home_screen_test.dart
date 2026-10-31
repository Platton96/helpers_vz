import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_vz/ui/home/home_screen.dart';

import '../../helpers/test_app.dart';

void main() {
  setUpTestApp();

  for (final size in [phoneSize, tabletSize, desktopSize]) {
    testWidgets('shows the Russian title and subtitle at $size', (tester) async {
      await pumpTestApp(tester, const HomeScreen(), size: size);

      expect(find.text(russianStrings.homeTitle), findsOneWidget);
      expect(find.text(russianStrings.homeSubtitle), findsOneWidget);
    });
  }

  testWidgets('shows the English subtitle for the English locale', (tester) async {
    await pumpTestApp(tester, const HomeScreen(), size: phoneSize, locale: const Locale('en'));

    expect(find.text(englishStrings.homeSubtitle), findsOneWidget);
  });
}
