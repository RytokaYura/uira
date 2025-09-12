import 'package:flutter/material.dart';

class AppListBuilder extends StatelessWidget {
  final int? count;
  final Axis? scrollDirection;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final NullableIndexedWidgetBuilder? builder;
  const AppListBuilder({super.key, this.count, this.scrollDirection, this.physics, this.padding, this.builder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count ?? 4,
      scrollDirection: scrollDirection ?? Axis.vertical,
      physics: physics ?? NeverScrollableScrollPhysics(),
      padding: padding ?? EdgeInsets.zero,
      itemBuilder: builder ?? (context, index) => SizedBox(),
    );
  }
}
