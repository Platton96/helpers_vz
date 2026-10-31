import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpers_vz/di/di.dart';
import 'package:helpers_vz/localizations/generated/app_strings.dart';
import 'package:helpers_vz/ui_kit/app_theme.dart';

const Size phoneSize = Size(390, 844);
const Size tabletSize = Size(820, 1180);
const Size desktopSize = Size(1440, 900);

final AppStrings russianStrings = lookupAppStrings(const Locale('ru'));
final AppStrings englishStrings = lookupAppStrings(const Locale('en'));

void setUpTestApp() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);
  setUp(configureDependencies);
  tearDown(getIt.reset);
}

Future<void> pumpTestApp(
  WidgetTester tester,
  Widget home, {
  required Size size,
  Locale locale = const Locale('ru'),
}) async {
  tester.view
    ..physicalSize = size
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.dark,
      locale: locale,
      localizationsDelegates: AppStrings.localizationsDelegates,
      supportedLocales: AppStrings.supportedLocales,
      home: home,
    ),
  );
  await tester.pumpAndSettle();
}
