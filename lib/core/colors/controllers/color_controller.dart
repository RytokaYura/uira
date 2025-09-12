import 'package:flutter/material.dart';
import '../color_path.dart';

class ColorController {
  final AppColor _colorImpl;
  final Map<String, dynamic> _cache = {};

  ColorController({required AppColor colorImpl}) : _colorImpl = colorImpl;

  ColorData getColor({required Brightness brightness}) {
    final key = '${_colorImpl.runtimeType}_${brightness.toString()}';
    return _cache.putIfAbsent(key, () => _colorImpl.getColor(brightness: brightness));
  }
}