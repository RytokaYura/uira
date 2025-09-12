import 'package:flutter/material.dart';

import '../theme_path.dart';

class ThemeController {
  final ThemeFactory _themeFactory;

  ThemeController({required ThemeFactory themeFactory}) : _themeFactory = themeFactory;

  ThemeData get light => _themeFactory.getTheme(brightness: Brightness.light);
  ThemeData get dark => _themeFactory.getTheme(brightness: Brightness.dark);
}