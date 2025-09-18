import 'package:flutter/material.dart';

import '../common_path.dart';

class AppGridBuilder extends StatelessWidget {
  final bool? shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final int? itemCount;
  final ScrollPhysics? physics;
  final int? crossAxisCount;
  final double? aspectRatio;
  final double? crossSpacing;
  final double? mainSpacing;
  final NullableIndexedWidgetBuilder? itemBuilder;
  const AppGridBuilder({super.key, this.shrinkWrap, this.padding, this.itemCount, this.physics, this.crossAxisCount, this.aspectRatio, this.crossSpacing, this.mainSpacing, this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap ?? true,
      padding: padding ?? EdgeInsets.all(15.0),
      itemCount: itemCount ?? 4,
      physics: physics ?? NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 2,
        childAspectRatio: aspectRatio ?? 3.0,
        crossAxisSpacing: crossSpacing ?? 8.0,
        mainAxisSpacing: mainSpacing ?? 8.0,
      ),
      itemBuilder: itemBuilder ?? (BuildContext context, int index) {
        if(index == 3) {
          return AppCardAll();
        }
        return AppCardItem();
      },
    );
  }
}
