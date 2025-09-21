part of 'music_player_bloc.dart';

@immutable
sealed class MusicPlayerState {}

final class MusicPlayerInitial extends MusicPlayerState {}
final class MusicPlayerLoading extends MusicPlayerState {}

final class MusicPlaybackState<T extends BaseData> extends MusicPlayerState {
  final Duration position;
  final Duration duration;
  final List<T> playlist;
  final int currentIndex;
  final bool isShuffleActive;
  final RepeatMode repeatMode;
  final PlayBackCycleMode cycleMode;
  final bool isPlaying;

  MusicPlaybackState({
    required this.position,
    required this.duration,
    required this.playlist,
    required this.currentIndex,
    this.isShuffleActive = false,
    this.repeatMode = RepeatMode.all,
    this.cycleMode = PlayBackCycleMode.sequential,
    required this.isPlaying,
  });

  T get currentSong => playlist[currentIndex];

  MusicPlaybackState<T> copyWith({
    Duration? position,
    Duration? duration,
    List<T>? playlist,
    int? currentIndex,
    bool? isShuffleActive,
    RepeatMode? repeatMode,
    PlayBackCycleMode? cycleMode,
    bool? isPlaying,
  }) {
    return MusicPlaybackState(
      position: position ?? this.position,
      duration: duration ?? this.duration,
      playlist: playlist ?? this.playlist,
      currentIndex: currentIndex ?? this.currentIndex,
      isShuffleActive: isShuffleActive ?? this.isShuffleActive,
      repeatMode: repeatMode ?? this.repeatMode,
      cycleMode: cycleMode ?? this.cycleMode,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

class MusicFailure extends MusicPlayerState {
  final String message;
  MusicFailure(this.message);
}