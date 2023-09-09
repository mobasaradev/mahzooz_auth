import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_template/theme/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();
  static final _textStyle = GoogleFonts.lato();
  static TextTheme common = TextTheme(
    bodySmall: _textStyle.copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: AppColors.tiredTextColor,
    ),
    bodyMedium: _textStyle.copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: AppColors.tiredTextColor,
    ),
    labelSmall: _textStyle.copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 8,
      color: AppColors.tiredTextColor,
    ),
  );
}
