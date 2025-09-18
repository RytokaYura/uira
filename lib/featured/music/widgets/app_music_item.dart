import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../common/common_path.dart';

class AppMusicItem extends StatelessWidget {
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final String? imageAsset;
  final String? title;
  final String? album;
  final String? artist;
  const AppMusicItem({super.key, this.onTap, this.borderRadius, this.color, this.padding, this.imageAsset, this.title, this.album, this.artist, });

  @override
  Widget build(BuildContext context) {
    return AppCardItem(
      onTap: onTap,
      borderRadius: borderRadius,
      color: color,
      padding: padding,
      content: Row(
        spacing: 15.0,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: AppImage(
              assetPath: imageAsset,
              borderRadius: BorderRadius.circular(3.0),
              iconData: PhosphorIcons.musicNotes(PhosphorIconsStyle.fill),
            ),
          ),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTitle(
                  title: title,
                  size: 14.0,
                  maxLines: 1,
                ),

                Row(
                  spacing: 5.0,
                  children: [
                    if(album != null)
                      Flexible(
                        flex: 1,
                        child: AppDescription(
                          title: album,
                          maxLines: 1,
                          size: 14.0,
                        ),
                      ),

                    if(artist != null && album != null)
                      AppDescription(
                        title: '|',
                      ),

                    if(artist != null)
                      Flexible(
                        flex: 2,
                        child: AppDescription(
                          title: artist,
                          maxLines: 1,
                          size: 14.0,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
