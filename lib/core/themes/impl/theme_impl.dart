import 'package:flutter/material.dart';

import '../../../core/core_path.dart';

class ThemeImpl extends AppTheme {
  @override
  AppBarTheme getAppBarTheme({required ColorScheme scheme, required Color color}) {
    return AppBarTheme(
      backgroundColor: color,
      foregroundColor: scheme.onSurface,
      elevation: 2.0,
      titleTextStyle: TextStyle(
        color: scheme.onSurface,
        fontSize: 21.0,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      ),
      iconTheme: IconThemeData(color: scheme.onSurface,),
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  BottomNavigationBarThemeData getBottomBarTheme({required ColorScheme scheme, required Color color, required Color unContent}) {
    return BottomNavigationBarThemeData(
      backgroundColor: color,
      elevation: 0.0,
      unselectedItemColor: unContent,
      selectedItemColor: scheme.onSurface,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }

  @override
  ColorScheme getColorScheme({required Brightness brightness, required ColorData color}) {
    final scheme = ColorScheme.fromSeed(seedColor: color.primary, brightness: brightness);

    return scheme.copyWith(
      surface: color.surface,
      onSurface: color.onBackground,
      error: color.error,
      onError: color.onPrimary,
      primary: color.primary,
      onPrimary: color.onPrimary,
      secondary: color.secondary,
      onSecondary: color.onPrimary,
      scrim: Colors.black.withValues(alpha: .75),
    );
  }

  @override
  ElevatedButtonThemeData getElevatedTheme({required ColorScheme scheme, required Color disabled, required Color disabledContent}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        disabledBackgroundColor: disabledContent,
        disabledForegroundColor: disabledContent,
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  FloatingActionButtonThemeData getFloatingTheme({required ColorScheme scheme}) {
    return FloatingActionButtonThemeData(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
    );
  }

  @override
  InputDecorationTheme getInputDecoration({required ColorScheme scheme, required Color hint}) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surface.withValues(alpha: .3),
      labelStyle: TextStyle(color: hint, fontSize: 14.0),
      hintStyle: TextStyle(color: hint, fontSize: 14.0),
      iconColor: scheme.surface,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.primary, width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.surface, width: 1.8),
        borderRadius: BorderRadius.circular(5),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.surface, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scheme.error, width: 1.8),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  TextTheme getTextTheme({required Color color}) {
    final baseStyle = TextStyle(color: color);
    return TextTheme(
      headlineLarge: baseStyle.copyWith(fontSize: 28.0, fontWeight: FontWeight.w900,),
      headlineMedium: baseStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w700),
      headlineSmall: baseStyle.copyWith(fontSize: 21.0, fontWeight: FontWeight.w700),

      titleLarge: baseStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w700),
      titleMedium: baseStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600),

      bodyLarge: baseStyle.copyWith(fontSize: 18.0, overflow: TextOverflow.ellipsis),
      bodyMedium: baseStyle.copyWith(fontSize: 16.0, overflow: TextOverflow.ellipsis),
      bodySmall: baseStyle.copyWith(fontSize: 14.0, overflow: TextOverflow.ellipsis),
    );
  }

  @override
  BottomSheetThemeData getBottomSheetTheme({required ColorScheme scheme}) {
    return BottomSheetThemeData(
      backgroundColor: scheme.surface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),),
      elevation: 2.0,
    );
  }
}