import 'package:flutter/material.dart';

class ThemeSettingModel {
  final ThemeMode? mode;
  final String? label;
  final IconData? icon;
  final IconData? activeIcon;
  final Color? color;


  ThemeSettingModel({required this.mode, required this.label, required this.icon, required this.activeIcon, required this.color,});
}