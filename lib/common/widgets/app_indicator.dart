import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppPageIndicator extends StatelessWidget {
  final PageController? controller;
  final int? count;
  final double? dotSize;
  final Color? color;
  final Color? activeColor;
  const AppPageIndicator({super.key, this.controller, this.count, this.dotSize, this.color, this.activeColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = dotSize ?? 12.0;
    return SmoothPageIndicator(
      controller: controller ?? PageController(),
      count: count ?? 4,
      effect: JumpingDotEffect(
        dotHeight: size,
        dotWidth: size,
        dotColor: color ?? theme.hintColor.withValues(alpha: .5),
        activeDotColor: activeColor ?? theme.primaryColor,
      ),
    );
  }
}
