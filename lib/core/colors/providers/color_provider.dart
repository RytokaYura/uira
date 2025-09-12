import 'package:flutter/material.dart';
import '../color_path.dart';

class ColorProvider implements AppColor {
  @override
  ColorData getColor({required Brightness brightness}) => brightness == Brightness.dark ? DarkColor() : LightColor();
}