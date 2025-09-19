import 'package:flutter/material.dart';

class AppScrim extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const AppScrim({super.key, this.width, this.height, this.color, this.borderRadius, this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.black.withValues(alpha: .75),
        borderRadius: borderRadius ?? BorderRadius.zero,
      ),
      padding: padding ?? EdgeInsets.zero,
      child: child,
    );
  }
}
