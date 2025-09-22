import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../music_path.dart';
import '../../../common/common_path.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<MusicPlayerBloc<MockMusicModel>, MusicPlayerState>(
      builder: (context, state) {
        if (state is! MusicPlaybackState<MockMusicModel>) {
          return Scaffold(
            appBar: UiraAppBar(isBack: true),
            body: Center(
              child: state is MusicFailure
                  ? Text('Error: ${state.message}')
                  : const CircularProgressIndicator(),
            ),
          );
        }

        final currentSong = state.currentSong;
        final position = state.position;
        final totalDuration = state.duration;

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
              MusicCover(pathCover: currentSong.cover,),

              MusicSection(
                title: currentSong.title,
                artist: currentSong.artist,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
                child: AppProgressBar(
                  progress: position,
                  total: totalDuration,
                  timeLabelLocation: TimeLabelLocation.sides,
                  onSeek: (newPosition) => context.read<MusicPlayerBloc<MockMusicModel>>().add(MusicSeekRequested(newPosition)),
                ),
              ),

              MusicControl(
                isPlay: state.isPlaying,
                mode: state.cycleMode,
                onMode: () => context.read<MusicPlayerBloc<MockMusicModel>>().add(CycleModeToggled()),
                onPlay: () => state.isPlaying ? context.read<MusicPlayerBloc<MockMusicModel>>().add(MusicPauseRequested()) : context.read<MusicPlayerBloc<MockMusicModel>>().add(MusicPlayRequested()),
                onNext: () => context.read<MusicPlayerBloc<MockMusicModel>>().add(NextSongRequested()),
                onPrev: () => context.read<MusicPlayerBloc<MockMusicModel>>().add(PreviousSongRequested()),
                colorPrev: state.currentIndex == 0 ? theme.hintColor : null,
                colorNext: state.currentIndex == state.playlist.length - 1 ? theme.hintColor : null,
              ),

               MusicCreditInfo(
                title: currentSong.title,
                artist: currentSong.artist,
                album: currentSong.album,
                genre: currentSong.genre,
                year: currentSong.release?.year.toString(),
              ),

              SizedBox(height: 25.0,),
            ],
          ),
        );
      },
    );
  }
}

