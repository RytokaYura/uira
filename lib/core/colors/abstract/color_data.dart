import 'dart:ui';

abstract class ColorData {

  Color get background;
  Color get primary;
  Color get secondary;
  Color get surface;
  Color get error;
  Color get warning;
  Color get success;
  Color get disabled;
  Color get hint;
  Color get scrim;

  Color get onBackground;
  Color get onPrimary;
}