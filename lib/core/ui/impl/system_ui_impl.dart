import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/core_path.dart';

class SystemUIImpl extends SystemUI {
  final ColorController _colorController;

  SystemUIImpl({required ColorController colorController}) : _colorController = colorController;

  @override
  SystemUiOverlayStyle getOverlayStyle({required Brightness brightness}) {
    final color = _colorController.getColor(brightness: brightness);
    return SystemUiOverlayStyle(
      statusBarColor: color.background,
      statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: color.background,
      systemNavigationBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light,
      statusBarBrightness: brightness == Brightness.light ? Brightness.light : Brightness.dark,
    );
  }
}

class SystemUIIntroImpl extends SystemUI {
  @override
  SystemUiOverlayStyle getOverlayStyle({required Brightness brightness}) {
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    );
  }
}