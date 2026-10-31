import 'package:flutter/material.dart';
import 'package:helpers_vz/localizations/generated/app_strings.dart';
import 'package:helpers_vz/ui/home/home_screen.dart';
import 'package:helpers_vz/ui_kit/app_theme.dart';

class HelpersApp extends StatelessWidget {
  const HelpersApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        onGenerateTitle: (context) => AppStrings.of(context).appTitle,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        localizationsDelegates: AppStrings.localizationsDelegates,
        supportedLocales: AppStrings.supportedLocales,
        home: const HomeScreen(),
      );
}
