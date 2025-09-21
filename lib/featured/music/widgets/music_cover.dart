import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../common/common_path.dart';

class MusicCover extends StatelessWidget {
  final String? pathCover;
  const MusicCover({super.key, this.pathCover});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: AppCardItem(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(13.0),
          shadow: [
            BoxShadow(
              color: theme.colorScheme.scrim.withValues(alpha: .5),
              blurRadius: 6,
              spreadRadius: 0,
              offset: Offset(0, 3),
            ),
            BoxShadow(
              color: theme.colorScheme.scrim.withValues(alpha: .3),
              blurRadius: 6,
              spreadRadius: 0,
              offset: Offset(0, 3),
            )
          ],
          content: Center(
            child: AppImage(borderRadius: BorderRadius.circular(8.0), assetPath: pathCover, iconData: PhosphorIcons.musicNotes(PhosphorIconsStyle.fill), iconSize: 52,),
          ),
        ),
      ),
    );
  }
}
