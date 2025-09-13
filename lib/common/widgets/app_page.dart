import 'package:flutter/material.dart';

class AppPageBuilder extends StatelessWidget {
  final ScrollPhysics? physics;
  final int? itemCount;
  final PageController? controller;
  final Function(int index)? onPageChanged;
  final NullableIndexedWidgetBuilder? itemBuilder;
  const AppPageBuilder({super.key, this.physics, this.itemCount, this.controller, this.onPageChanged, this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: physics ?? NeverScrollableScrollPhysics(),
      itemCount: itemCount ?? 4,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: itemBuilder ?? (context, index) => SizedBox(),
    );
  }
}
