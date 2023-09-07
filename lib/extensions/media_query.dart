import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);
  
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

}

