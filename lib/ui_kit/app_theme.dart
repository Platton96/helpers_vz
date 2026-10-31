import 'package:flutter/material.dart';
import 'package:helpers_vz/ui_kit/app_colors.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.background,
          onSurface: AppColors.textPrimary,
        ),
      );

  const AppTheme._();
}
