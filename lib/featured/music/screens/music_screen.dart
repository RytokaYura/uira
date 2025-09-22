import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common_path.dart';
import '../../../core/core_path.dart';
import '../music_path.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final MockMusic mockMusic = MockMusic();

    final playbackState = context.select((MusicPlayerBloc<MockMusicModel> bloc) {
          final state = bloc.state;
          return state is MusicPlaybackState<MockMusicModel> ? state : null;}
    );

    final theme = Theme.of(context);

    return Scaffold(
      appBar: UiraAppBar(
        title: 'Music',
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppSection(title: 'Favorite',),

            const FavoriteListMusic(),

            const AppSection(title: 'All Music'),

            AppListBuilder(
              count: mockMusic.data.length,
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
                    color: playbackState?.currentSong.id == item.id ? theme.colorScheme.primary.withValues(alpha: .5) : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 5.0,
                    ),
                    title: item.title,
                    album: item.album,
                    artist: item.artist,
                    imageAsset: item.cover,
                  ),
                );
              },
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
