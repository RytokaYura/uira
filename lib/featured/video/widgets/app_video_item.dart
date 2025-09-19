import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:uira/core/core_path.dart';

import '../../../common/common_path.dart';

class AppVideoItem extends StatelessWidget {
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final String? imageAsset;
  final String? title;
  final List<String>? genre;
  final Duration? duration;
  const AppVideoItem({super.key, this.onTap, this.borderRadius, this.color, this.padding, this.imageAsset, this.title, this.genre, this.duration});

  @override
  Widget build(BuildContext context) {
    return AppCardItem(
      onTap: onTap,
      borderRadius: BorderRadius.zero,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      content: Row(
        spacing: 15.0,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: AppImage(
              assetPath: imageAsset,
              borderRadius: BorderRadius.circular(3.0),
              iconData: PhosphorIcons.filmReel(PhosphorIconsStyle.fill),
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
                    if(duration != null)
                      Flexible(
                        flex: 1,
                        child: AppDescription(
                          title: duration?.toHourMinute(),
                          maxLines: 1,
                          size: 14.0,
                        ),
                      ),

                    if(duration != null && genre != null)
                      AppDescription(
                        title: '|',
                      ),

                    if(genre != null)
                      Flexible(
                        flex: 2,
                        child: AppDescription(
                          title: genre?.join(' · '),
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
