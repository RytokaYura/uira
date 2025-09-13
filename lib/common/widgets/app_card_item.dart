import 'package:flutter/material.dart';

class AppCardItem extends StatelessWidget {
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? highlightColor;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? content;
  const AppCardItem({super.key, this.onTap, this.borderRadius, this.highlightColor, this.width, this.height, this.color, this.padding, this.margin, this.content,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = borderRadius ?? BorderRadius.circular(8.0);
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      highlightColor: highlightColor ?? theme.colorScheme.primary.withValues(alpha: .5),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: color ?? theme.colorScheme.surface.withValues(alpha: .5),
        ),
        padding: padding ?? EdgeInsets.all(5.0),
        child: content,
      ),
    );
  }
}
