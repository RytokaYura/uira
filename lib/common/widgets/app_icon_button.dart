import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? highlightColor;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;
  final Color? color;
  final double? size;
  const AppIconButton({super.key, this.onTap, this.borderRadius, this.highlightColor, this.padding, this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      highlightColor: highlightColor ?? theme.hintColor.withValues(alpha: .2),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(5.0),
        child: Icon(icon ?? PhosphorIcons.arrowLeft(),
          color: color,
          size: size,
        ),
      ),
    );
  }
}
