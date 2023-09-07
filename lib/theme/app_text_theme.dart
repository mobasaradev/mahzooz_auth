import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();
  static final _textStyle = GoogleFonts.poppins();
  static TextTheme common = TextTheme(
    headlineLarge: _textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    headlineMedium: _textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
  );
}
