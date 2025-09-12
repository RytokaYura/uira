import 'package:flutter/material.dart';
import '../../colors/color_path.dart';

abstract class AppTheme {
  ColorScheme getColorScheme({required Brightness brightness, required ColorData color});
  TextTheme getTextTheme({required Color color});
  InputDecorationTheme getInputDecoration({required ColorScheme scheme, required Color hint});
  ElevatedButtonThemeData getElevatedTheme({required ColorScheme scheme, required Color disabled, required Color disabledContent});
  AppBarTheme getAppBarTheme({required ColorScheme scheme, required Color color});
  FloatingActionButtonThemeData getFloatingTheme({required ColorScheme scheme});
  BottomNavigationBarThemeData getBottomBarTheme({required ColorScheme scheme, required Color color, required Color unContent});
  BottomSheetThemeData getBottomSheetTheme({required ColorScheme scheme});
}