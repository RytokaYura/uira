import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../common/common_path.dart';
import '../../feature_path.dart';

class MusicControl extends StatelessWidget {
  final PlayBackCycleMode? mode;
  final VoidCallback? onMode;
  final VoidCallback? onPrev;
  final VoidCallback? onPlay;
  final VoidCallback? onNext;
  final VoidCallback? onEqualizer;
  final bool isPlay;
  final Color? colorPrev;
  final Color? colorNext;

  const MusicControl({
    super.key,
    this.mode,
    this.onMode,
    this.onPrev,
    this.onPlay,
    this.onNext,
    this.onEqualizer,
    this.isPlay = true,
    this.colorPrev,
    this.colorNext,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    IconData getIconMode() {
      switch (mode) {
        case PlayBackCycleMode.sequential:
          return PhosphorIcons.repeat();
        case PlayBackCycleMode.repeatOne:
          return PhosphorIcons.repeatOnce();
        case PlayBackCycleMode.shuffle:
          return PhosphorIcons.shuffle();
        default:
          return PhosphorIcons.repeat();
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIconButton(
            onTap: onMode,
            icon: getIconMode(),
            color: theme.hintColor,
          ),
          AppIconButton(
            onTap: onPrev,
            icon: PhosphorIcons.skipBack(PhosphorIconsStyle.fill),
            color: colorPrev,
          ),
          AppIconButton(
            onTap: onPlay,
            icon: isPlay
                ? PhosphorIcons.pauseCircle(PhosphorIconsStyle.fill)
                : PhosphorIcons.playCircle(PhosphorIconsStyle.fill),
            size: 52.0,
          ),
          AppIconButton(
            onTap: onNext,
            icon: PhosphorIcons.skipForward(PhosphorIconsStyle.fill),
            color: colorNext,
          ),
          AppIconButton(
            onTap: onEqualizer,
            icon: PhosphorIcons.sliders(),
            color: theme.hintColor,
          ),
        ],
      ),
    );
  }
}
