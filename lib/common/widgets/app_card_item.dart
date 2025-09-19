import 'package:flutter/material.dart';

import '../common_path.dart';

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
  final List<BoxShadow>? shadow;
  const AppCardItem({super.key, this.onTap, this.borderRadius, this.highlightColor, this.width, this.height, this.color, this.padding, this.margin, this.content, this.shadow,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = borderRadius ?? BorderRadius.circular(8.0);
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      highlightColor: highlightColor ?? theme.hintColor.withValues(alpha: .2),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: color ?? theme.colorScheme.surface.withValues(alpha: .5),
          boxShadow: shadow,
        ),
        padding: padding ?? EdgeInsets.all(5.0),
        child: content,
      ),
    );
  }
}

class AppCardAll extends StatelessWidget {
  final VoidCallback? onTap;
  const AppCardAll({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCardItem(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.0),
      content: Center(
        child: AppTitle(
          title: 'See all',
          size: 14.0,
          maxLines: 1,
        ),
      ),
    );
  }
}

