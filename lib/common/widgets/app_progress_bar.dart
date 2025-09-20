import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class AppProgressBar extends StatelessWidget {
  final Duration? progress;
  final Duration? total;
  final TimeLabelLocation? timeLabelLocation;
  final TimeLabelType? timeLabelType;
  final double? barHeight;
  final double? thumbRadius;
  const AppProgressBar({super.key, this.progress, this.total, this.timeLabelLocation, this.timeLabelType, this.barHeight, this.thumbRadius,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ProgressBar(
      progress: progress ?? Duration(minutes: 0,),
      total: total ?? Duration(minutes: 3, seconds: 45),
      timeLabelLocation: timeLabelLocation ?? TimeLabelLocation.sides,
      timeLabelType: timeLabelType,
      barHeight: barHeight ?? 3.0,
      thumbRadius: thumbRadius ?? 5.0,
      timeLabelTextStyle: theme.textTheme.titleMedium!.copyWith(
        color: theme.hintColor,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      ),
    );
  }
}
