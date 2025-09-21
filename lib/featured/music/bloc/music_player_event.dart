part of 'music_player_bloc.dart';


@immutable
sealed class MusicPlayerEvent {}


final class MusicNewPlayListRequested<T extends BaseData> extends MusicPlayerEvent {
  final List<T> playlist;
  final int startIndex;

  MusicNewPlayListRequested({required this.playlist, this.startIndex = 0});
}

final class MusicPlayRequested extends MusicPlayerEvent {}

final class MusicPauseRequested extends MusicPlayerEvent {}

final class MusicSeekRequested extends MusicPlayerEvent {
  final Duration position;
  MusicSeekRequested(this.position);
}

final class NextSongRequested extends MusicPlayerEvent {}

final class PreviousSongRequested extends MusicPlayerEvent {}

final class CycleModeToggled extends MusicPlayerEvent {}


final class _SongCompleted extends MusicPlayerEvent {}

final class _PlayBackMusicProgressUpdated extends MusicPlayerEvent {
  final PlayBackEvent event;
  _PlayBackMusicProgressUpdated({required this.event});
}

final class _ReportError extends MusicPlayerEvent {
  final String message;
  _ReportError(this.message);
}