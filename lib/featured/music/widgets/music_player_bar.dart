import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../common/common_path.dart';
import '../../../core/core_path.dart';
import '../music_path.dart';

class MusicPlayerBar extends StatelessWidget {
  const MusicPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<MusicPlayerBloc<MockMusicModel>, MusicPlayerState>(
      builder: (context, state) {
        MockMusicModel? currentSong;
        bool isPlaying = false;
        List<MockMusicModel> playlist = [];
        int index = 0;

        if (state is MusicPlaybackState<MockMusicModel>) {
          currentSong = state.currentSong;
          isPlaying = state.isPlaying;
          playlist = state.playlist;
          index = state.currentIndex;
        }

        return AnimatedPositioned(
          left: 10.0,
          right: 10.0,
          bottom: state is MusicPlaybackState<MockMusicModel> ? 5.0 : -80.0,
          duration: Duration(milliseconds: 350),
          child: AspectRatio(
            aspectRatio: 5.5,
            child: AppCardItem(
              color: theme.scaffoldBackgroundColor,
              onTap: () => RouteHelper().goPush(context, AppRoutePath.musicPlayer),
              content: AppCardItem(
                content: Row(
                  spacing: 15.0,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: AppImage(
                        assetPath: currentSong?.cover,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTitle(
                            title: currentSong?.title,
                            size: 16.0,
                          ),

                          AppDescription(
                            title: currentSong?.artist != null ? currentSong?.artist?.join(' · ') : 'Unknown',
                            size: 14.0,
                          ),
                        ],
                      ),
                    ),

                    Row(
                      spacing: 5.0,
                      children: [
                        AppIconButton(
                          onTap: () => context.read<MusicPlayerBloc<MockMusicModel>>().add(PreviousSongRequested()),
                          icon: PhosphorIcons.skipBack(
                            PhosphorIconsStyle.fill,
                          ),
                          color: index == 0 ? theme.hintColor : null,
                        ),

                        AppIconButton(
                          onTap: () => isPlaying ? context.read<MusicPlayerBloc<MockMusicModel>>().add(MusicPauseRequested()) : context.read<MusicPlayerBloc<MockMusicModel>>().add(MusicPlayRequested()),
                          icon: isPlaying
                              ? PhosphorIcons.pause(PhosphorIconsStyle.fill,)
                              : PhosphorIcons.play(PhosphorIconsStyle.fill,),
                        ),

                        AppIconButton(
                          onTap: () => context.read<MusicPlayerBloc<MockMusicModel>>().add(NextSongRequested()),
                          icon: PhosphorIcons.skipForward(
                            PhosphorIconsStyle.fill,
                          ),
                          color: index == playlist.length - 1 ? theme.hintColor : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
