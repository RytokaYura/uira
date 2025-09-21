part of 'music_player_bloc.dart';

@immutable
sealed class MusicPlayerEvent {}

final class MusicNewPlayListRequested<T> extends MusicPlayerEvent {
  final List<T> playlist;
  final int startIndex;

  MusicNewPlayListRequested({required this.playlist, required this.startIndex});
}

final class MusicPlayRequested extends MusicPlayerEvent {}
final class MusicPauseRequested extends MusicPlayerEvent {}

final class MusicSeekRequested extends MusicPlayerEvent {
  final Duration duration;

  MusicSeekRequested({required this.duration});
}

final class NextSongRequested extends MusicPlayerEvent {}
final class PreviousSongRequested extends MusicPlayerEvent {}

final class ShuffleToggled extends MusicPlayerEvent {}
final class RepeatModeChanged extends MusicPlayerEvent {}

final class _SongCompleted extends MusicPlayerEvent {}

final class _PlayBackMusicProgressUpdated extends MusicPlayerEvent {
  final PlayBackEvent event;

  _PlayBackMusicProgressUpdated({required this.event});
}

final class _ReportError extends MusicPlayerEvent {
  final String message;
  _ReportError(this.message);
}