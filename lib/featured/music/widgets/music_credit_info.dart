import 'package:flutter/material.dart';

import '../../../common/common_path.dart';
import '../../../core/core_path.dart';

class MusicCreditInfo extends StatelessWidget {
  final String? title;
  final List<String>? artist;
  final String? album;
  final List<String>? genre;
  final String? year;
  const MusicCreditInfo({super.key, this.title, this.artist, this.album, this.genre, this.year});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppCardItem(
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
                TableHelper.buildRow(label: 'Title', value: title),
                TableHelper.buildRow(label: 'Artist', value: artist?.join(' · ')),
                TableHelper.buildRow(label: 'Album', value: album),
                TableHelper.buildRow(label: 'Genre', value: genre?.join(' · ')),
                TableHelper.buildRow(label: 'Release', value: year),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
