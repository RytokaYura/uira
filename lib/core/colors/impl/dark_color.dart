import 'dart:ui';

import '../color_path.dart';

class DarkColor extends ColorData {
  @override Color get background => const Color(0xFF111415);
  @override Color get disabled => Color.lerp(primary, surface, .8)!;
  @override Color get error => const Color(0xFFEF5350);
  @override Color get hint => const Color(0xFFAAAAAA);
  @override Color get onBackground => const Color(0xFFF5F5F5);
  @override Color get onPrimary => const Color(0xFFFFFFFF);
  @override Color get primary => const Color(0xFFDC143C);
  @override Color get secondary => const Color(0xFF750E21);
  @override Color get surface => const Color(0xFF222831);
  @override Color get success => const Color(0xFF0BA6DF);
  @override Color get warning => const Color(0xFFFAA533);
}