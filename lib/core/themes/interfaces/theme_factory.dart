import 'package:flutter/material.dart';

abstract class ThemeFactory {
  ThemeData getTheme({required Brightness brightness});
}