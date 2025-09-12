import 'package:flutter/material.dart';
import '../color_path.dart';

abstract class AppColor {
  ColorData getColor({required Brightness brightness});
}