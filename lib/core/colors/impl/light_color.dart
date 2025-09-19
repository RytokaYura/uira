import 'package:flutter/material.dart';

import '../color_path.dart';

class LightColor extends ColorData {
  @override Color get background => const Color(0xFFFFFFFF);
  @override Color get disabled => Color.lerp(primary, surface, .8)!;
  @override Color get error => const Color(0xFFEF5350);
  @override Color get hint => const Color(0xFF888888);
  @override Color get onBackground => const Color(0xFF151515);
  @override Color get onPrimary => const Color(0xFFFFFFFF);
  @override Color get primary => const Color(0xFFDC143C);
  @override Color get secondary => const Color(0xFF750E21);
  @override Color get surface => const Color(0xFFE0E0E0);
  @override Color get success => const Color(0xFF0BA6DF);
  @override Color get warning => const Color(0xFFFAA533);
  @override Color get scrim => Colors.black.withValues(alpha: .75);
}