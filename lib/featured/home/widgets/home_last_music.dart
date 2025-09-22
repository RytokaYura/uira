import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common_path.dart';
import '../../../core/core_path.dart';
import '../../feature_path.dart';

class HomeLastMusic extends StatelessWidget {
  const HomeLastMusic({super.key});

  @override
  Widget build(BuildContext context) {
    final MockMusic mockMusic = MockMusic();
    final musicState = context.select((MusicPlayerBloc<MockMusicModel> bloc) {
      final state = bloc.state;
      return state is MusicPlaybackState<MockMusicModel> ? state : null;}
    );
    final theme = Theme.of(context);
    return AppListBuilder(
      count: min(10, mockMusic.data.length),
      builder: (context, index) {
        final item = mockMusic.data[index];
        return AppListVerticalItem(
          content: AppMusicItem(
            onTap: () {
              context.read<MusicPlayerBloc<MockMusicModel>>().add(
                MusicNewPlayListRequested(
                  playlist: mockMusic.data,
                  startIndex: index,
                ),
              );
              RouteHelper().goPush(context, AppRoutePath.musicPlayer);
            },
            borderRadius: BorderRadius.zero,
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            title: item.title,
            album: item.album,
            artist: item.artist,
            imageAsset: item.cover,
            color: musicState?.currentSong.id == item.id ? theme.colorScheme.primary.withValues(alpha: .5) : Colors.transparent,
          ),
        );
      },
    );
  }
}
