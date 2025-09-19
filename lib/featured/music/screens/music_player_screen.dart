import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../music_path.dart';
import '../../../common/common_path.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MockMusic mockMusic = MockMusic();

    final theme = Theme.of(context);
    return Scaffold(
      appBar: UiraAppBar(
        onTap: () {},
        isBack: true,
        title: 'playing now'.toUpperCase(),
        centerTitle: true,
        iconData: PhosphorIcons.dotsThreeVertical(),
      ),
      body: AppScrollView(
        content: [
          Padding(
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
                  child: AppImage(borderRadius: BorderRadius.circular(8.0), assetPath: mockMusic.data[2].cover,),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              spacing: 15.0,
              children: [
                AppIconButton(icon: PhosphorIcons.heart(), color: theme.hintColor,),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 5.0,
                      children: [
                        AppTitle(
                          title: mockMusic.data[2].title,
                        ),

                        AppDescription(
                          title: mockMusic.data[2].artist?.join(' · '),
                          size: 14.0,
                        ),
                      ],
                    ),
                  ),
                ),
                AppIconButton(icon: PhosphorIcons.timer(), color: theme.hintColor,),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            child: ProgressBar(
              progress: Duration(minutes: 1, seconds: 20),
              total: mockMusic.data[2].duration!,
              barHeight: 3.0,
              thumbRadius: 5.0,
              timeLabelTextStyle: theme.textTheme.titleMedium!.copyWith(
                color: theme.hintColor,
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppIconButton(icon: PhosphorIcons.repeat(), color: theme.hintColor,),
                AppIconButton(icon: PhosphorIcons.skipBack(PhosphorIconsStyle.fill),),
                AppIconButton(icon: PhosphorIcons.playCircle(PhosphorIconsStyle.fill), size: 52.0,),
                AppIconButton(icon: PhosphorIcons.skipForward(PhosphorIconsStyle.fill),),
                AppIconButton(icon: PhosphorIcons.sliders(), color: theme.hintColor,),
              ],
            ),
          ),

          AppCardItem(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            color: theme.colorScheme.surface.withValues(alpha: .5),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
            content: Column(
              spacing: 12.0,
              children: [
                AppSection(title: 'Credit', titlePadding: EdgeInsets.only(left: 10.0), endIndent: 10.0,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FixedColumnWidth(30),
                      2: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      _buildTableRow('Title', mockMusic.data[2].title),
                      _buildTableRow('Artist', mockMusic.data[2].artist?.join(' · ')),
                      _buildTableRow('Album', mockMusic.data[2].album),
                      _buildTableRow('Genre', mockMusic.data[2].genre?.join(' · ')),
                      _buildTableRow('Release', mockMusic.data[2].release?.year.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25.0,),
        ],
      ),
    );
  }
}

TableRow _buildTableRow(String label, String? value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: AppDescription(title: label),
      ),
      AppDescription(title: '\t\t:'),
      AppDescription(title: value ?? '-'),
    ],
  );
}