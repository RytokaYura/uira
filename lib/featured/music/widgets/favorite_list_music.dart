import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common_path.dart';
import '../../../core/core_path.dart';
import '../../feature_path.dart';

class FavoriteListMusic extends StatefulWidget {
  const FavoriteListMusic({super.key});

  @override
  State<FavoriteListMusic> createState() => _FavoriteListMusicState();
}

class _FavoriteListMusicState extends State<FavoriteListMusic> {

  final MockMusic mockMusic = MockMusic();
  List<MockMusicModel> allMusic = [];
  List<MockMusicModel> favoriteMusic = [];

  @override
  void initState() {
    super.initState();
    allMusic = List.of(mockMusic.data)..shuffle();

    favoriteMusic = allMusic.take(min(5, mockMusic.data.length)).toList();
  }
  @override
  Widget build(BuildContext context) {
    final musicState = context.select((MusicPlayerBloc<MockMusicModel> bloc) {
      final state = bloc.state;
      return state is MusicPlaybackState<MockMusicModel> ? state : null;}
    );
    final theme = Theme.of(context);
    return AppGridBuilder(
      itemCount: min(4, favoriteMusic.length),
      itemBuilder: (context, index) {
        final item = favoriteMusic[index];
        if (index == min(4, favoriteMusic.length) - 1 && favoriteMusic.length > 4) {
          return AppCardAll(onTap: () {},);
        }
        return AppMusicItem(
          onTap: () {
            context.read<MusicPlayerBloc<MockMusicModel>>().add(
              MusicNewPlayListRequested(
                playlist: allMusic,
                startIndex: index,
              ),
            );
            RouteHelper().goPush(context, AppRoutePath.musicPlayer);
          },
          title: item.title,
          artist: item.artist,
          imageAsset: item.cover,
          color: musicState?.currentSong.id == item.id ? theme.colorScheme.primary.withValues(alpha: .5) : null,
        );
      },
    );
  }
}
