import '../../../core/core_path.dart';
import 'package:flutter/material.dart';

class ThemeFactoryImpl implements ThemeFactory {
  final AppTheme _appTheme;
  final ColorController _colorController;

  ThemeFactoryImpl({required AppTheme appTheme, required ColorController colorController}) : _appTheme = appTheme, _colorController = colorController;

  @override
  ThemeData getTheme({required Brightness brightness}) {
    final color = _colorController.getColor(brightness: brightness);
    final scheme = _appTheme.getColorScheme(brightness: brightness, color: color);

    return ThemeData(
      colorScheme: scheme,
      brightness: brightness,
      scaffoldBackgroundColor: color.background,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: scheme.primary,
      focusColor: scheme.primary,
      primaryColor: color.primary,
      fontFamily: 'Ubuntu', 
      dividerColor: scheme.surface,
      textTheme: _appTheme.getTextTheme(color: scheme.onSurface),
      hintColor: color.hint,
      disabledColor: color.disabled,
      inputDecorationTheme: _appTheme.getInputDecoration(scheme: scheme, hint: color.hint),
      elevatedButtonTheme: _appTheme.getElevatedTheme(scheme: scheme, disabled: color.disabled, disabledContent: color.hint),
      appBarTheme: _appTheme.getAppBarTheme(scheme: scheme, color: color.background,),
      floatingActionButtonTheme: _appTheme.getFloatingTheme(scheme: scheme),
      bottomNavigationBarTheme: _appTheme.getBottomBarTheme(scheme: scheme, color: color.background, unContent: color.hint),
      dividerTheme: DividerThemeData(color: scheme.surface, thickness: 1.5),
      iconTheme: IconThemeData(color: scheme.onSurface),
      bottomSheetTheme: _appTheme.getBottomSheetTheme(scheme: scheme),
    );
  }

}