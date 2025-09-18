import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:uira/common/common_path.dart';

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
      shrinkWrap: true,
      itemBuilder: builder ?? (context, index) => SizedBox(),
    );
  }
}

class AppListVerticalItem extends StatelessWidget {
  final double? aspectRatio;
  final Widget? content;
  const AppListVerticalItem({super.key, this.aspectRatio, this.content});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 7.0,
      child: content ?? AppCardItem(),
    );
  }
}

class AppListHorizontalItem extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double? aspectRatio;
  final VoidCallback? onTap;
  final String? imageAsset;
  final String? title;
  const AppListHorizontalItem({super.key, this.padding, this.aspectRatio, this.onTap, this.imageAsset, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: AspectRatio(
        aspectRatio: aspectRatio ?? .75,
        child: AppCardItem(
          onTap: onTap,
          color: Colors.transparent,
          content: Column(
            spacing: 8.0,
            children: [
              Expanded(
                child: AppImage(
                  width: double.infinity,
                  height: double.infinity,
                  assetPath: imageAsset,
                  borderRadius: BorderRadius.circular(5.0),
                  fit: BoxFit.cover,
                ),
              ),

              AppTitle(title: title, size: 15.0, maxLines: 1,),
            ],
          ),
        ),
      ),
    );
  }
}

class AppListAllHorizontalItem extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? iconData;
  const AppListAllHorizontalItem({super.key, this.onTap, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: AspectRatio(
        aspectRatio: .75,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 35.0),
          child: AppCardItem(
            onTap: onTap,
            content: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 15.0,
                children: [
                  Icon(iconData ?? PhosphorIcons.filmReel(PhosphorIconsStyle.fill), size: 32.0,),
                  AppTitle(title: 'See all',)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


