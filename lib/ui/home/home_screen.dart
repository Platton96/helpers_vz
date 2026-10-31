import 'package:flutter/material.dart';
import 'package:helpers_vz/localizations/generated/app_strings.dart';
import 'package:helpers_vz/ui_kit/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          spacing: 12,
          children: [
            Text(strings.homeTitle, style: AppTextStyles.headline, textAlign: .center),
            Text(strings.homeSubtitle, style: AppTextStyles.body, textAlign: .center),
          ],
        ),
      ),
    );
  }
}
