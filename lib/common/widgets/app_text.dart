import 'package:flutter/material.dart';

class AppHeadline extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const AppHeadline({super.key, this.title, this.color, this.size, this.fontWeight, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title ?? 'Uira',
      style: theme.textTheme.headlineLarge!.copyWith(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}

class AppTitle extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  const AppTitle({super.key, this.title, this.color, this.size, this.fontWeight, this.textAlign, this.maxLines});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title ?? 'Uira',
      style: theme.textTheme.titleLarge!.copyWith(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}


class AppDescription extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  const AppDescription({super.key, this.title, this.color, this.size, this.fontWeight, this.textAlign, this.maxLines});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title ?? 'Uira',
      style: theme.textTheme.titleMedium!.copyWith(
        color: color ?? theme.hintColor,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
