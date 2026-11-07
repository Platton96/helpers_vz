import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpers_vz/ui_kit/app_colors.dart';

class AppTextStyles {
  static TextStyle get headline => GoogleFonts.unbounded(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get title => GoogleFonts.unbounded(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get body => GoogleFonts.golosText(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get question => GoogleFonts.golosText(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get measurement => GoogleFonts.golosText(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  static TextStyle get answer => GoogleFonts.unbounded(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.answer,
      );

  static TextStyle get figureLabel => GoogleFonts.golosText(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get equation => GoogleFonts.unbounded(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get formulaOption => GoogleFonts.golosText(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get optionLetter => GoogleFonts.unbounded(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.accent,
      );

  static TextStyle get graphLabel => GoogleFonts.golosText(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.graphMark,
      );

  static TextStyle get graphAxis => GoogleFonts.golosText(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
        color: AppColors.graphAxis,
      );

  static TextStyle get graphNumber => GoogleFonts.unbounded(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  const AppTextStyles._();
}
