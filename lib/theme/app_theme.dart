import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppTheme {
  static ThemeData themeData({
    Brightness? brightness,
    Color? seedColor,
  }) =>
      ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: brightness ?? Brightness.light,
          seedColor: Colors.white,
        ),
        textTheme: AppTextTheme.common,
      );
}