import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpers_vz/ui_kit/app_colors.dart';

class AppTextStyles {
  static TextStyle get headline => GoogleFonts.unbounded(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get body => GoogleFonts.golosText(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  const AppTextStyles._();
}
