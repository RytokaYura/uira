import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../common_path.dart';

class AppImage extends StatelessWidget {
  final BorderRadius? borderRadius;
  final String? assetPath;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final int? cacheW;
  final int? cacheH;
  final FilterQuality? filterQuality;
  final IconData? iconData;
  final double? iconSize;
  const AppImage({super.key, this.borderRadius, this.assetPath, this.fit, this.width, this.height, this.cacheW, this.cacheH, this.filterQuality, this.iconData, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.asset(assetPath ?? ImagePath.bg1,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
        cacheHeight: cacheH,
        cacheWidth: cacheW,
        filterQuality: filterQuality ?? FilterQuality.none,
        errorBuilder: (context, error, stackTrace) => Icon(iconData ?? PhosphorIcons.image(PhosphorIconsStyle.fill), size: iconSize,),
      ),
    );
  }
}
