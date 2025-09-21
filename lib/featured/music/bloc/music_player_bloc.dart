import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uira/core/core_path.dart';
import 'package:uira/featured/feature_path.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc<T extends BaseData> extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final AppPlayer _appPlayer;
  StreamSubscription? _playbackSubscription;

  MusicPlayerBloc({required AppPlayer appPlayer})
      : _appPlayer = appPlayer,
        super(MusicPlayerInitial()) {
    _playbackSubscription = _appPlayer.playbackEventStream.listen((e) {
      add(_PlayBackMusicProgressUpdated(event: e));
    });

    on<MusicNewPlayListRequested<T>>(_onPlayNewPlaylist);
    on<MusicPauseRequested>(_onPause);
    on<MusicPlayRequested>(_onPlay);
    on<NextSongRequested>(_onNextSong);
    on<PreviousSongRequested>(_onPreviousSong);
    on<_SongCompleted>(_onSongCompleted);
    on<_PlayBackMusicProgressUpdated>(_onProgressUpdated);
    on<_ReportError>((event, emit) => emit(MusicFailure(event.message)));
    on<CycleModeToggled>(_onCycleModeToggled);
    on<MusicSeekRequested>(_onSeekRequested);
  }

  bool _isPathValid(String? path, Emitter<MusicPlayerState> emit) {
    if (path == null) {
      emit(MusicFailure("File path is null"));
      return false;
    }
    return true;
  }

  int _getRandomIndex({required int playlistLength, required int currentIndex}) {
    if (playlistLength <= 1) return 0;
    var random = Random();
    int nextIndex;
    do {
      nextIndex = random.nextInt(playlistLength);
    } while (nextIndex == currentIndex);
    return nextIndex;
  }

  Future<void> _onPlayNewPlaylist(MusicNewPlayListRequested<T> event, Emitter<MusicPlayerState> emit) async {
    emit(MusicPlayerLoading());
    final path = event.playlist[event.startIndex].filePath;
    if (!_isPathValid(path, emit)) return;

    await _appPlayer.loadMediaFromRaw(path!);
    await _appPlayer.play();
    emit(MusicPlaybackState(
      isPlaying: true,
      position: Duration.zero,
      duration: Duration.zero,
      playlist: event.playlist,
      currentIndex: event.startIndex,
      isShuffleActive: false,
      repeatMode: RepeatMode.all,
      cycleMode: PlayBackCycleMode.sequential,
    ));
  }

  Future<void> _onPause(MusicPauseRequested event, Emitter<MusicPlayerState> emit) async {
    await _appPlayer.pause();
    if (state is MusicPlaybackState) {
      emit((state as MusicPlaybackState<T>).copyWith(isPlaying: false));
    }
  }

  Future<void> _onPlay(MusicPlayRequested event, Emitter<MusicPlayerState> emit) async {
    await _appPlayer.play();
    if (state is MusicPlaybackState) {
      emit((state as MusicPlaybackState<T>).copyWith(isPlaying: true));
    }
  }

  void _onProgressUpdated(_PlayBackMusicProgressUpdated event, Emitter<MusicPlayerState> emit) {
    if (state is MusicPlaybackState) {
      final currentState = state as MusicPlaybackState<T>;
      if (currentState.isPlaying && event.event.position >= event.event.duration && event.event.duration > Duration.zero) {
        add(_SongCompleted());
      } else {
        emit(currentState.copyWith(position: event.event.position, duration: event.event.duration));
      }
    }
  }

  Future<void> _onSongCompleted(_SongCompleted event, Emitter<MusicPlayerState> emit) async {
    if (state is! MusicPlaybackState) return;
    final currentState = state as MusicPlaybackState<T>;

    if (currentState.repeatMode == RepeatMode.one) {
      await _appPlayer.seekTo(Duration.zero);
      await _appPlayer.play();
      return;
    }

    if (currentState.isShuffleActive) {
      final nextIndex = _getRandomIndex(
        playlistLength: currentState.playlist.length,
        currentIndex: currentState.currentIndex,
      );
      await _playAtIndex(nextIndex, emit);
      return;
    }

    final isLastSong = currentState.currentIndex >= currentState.playlist.length - 1;
    if (isLastSong) {
      if (currentState.repeatMode == RepeatMode.all) {
        await _playAtIndex(0, emit);
      } else {
        emit(MusicPlayerInitial());
      }
    } else {
      await _playAtIndex(currentState.currentIndex + 1, emit);
    }
  }

  Future<void> _onNextSong(NextSongRequested event, Emitter<MusicPlayerState> emit) async {
    if (state is MusicPlaybackState) {
      final currentState = state as MusicPlaybackState<T>;

      if (currentState.isShuffleActive) {
        final nextIndex = _getRandomIndex(
          playlistLength: currentState.playlist.length,
          currentIndex: currentState.currentIndex,
        );
        await _playAtIndex(nextIndex, emit);
        return;
      }

      final isLastSong = currentState.currentIndex >= currentState.playlist.length - 1;
      if (isLastSong) {
        if (currentState.repeatMode == RepeatMode.all) {
          await _playAtIndex(0, emit);
        }
      } else {
        await _playAtIndex(currentState.currentIndex + 1, emit);
      }
    }
  }

  Future<void> _onPreviousSong(PreviousSongRequested event, Emitter<MusicPlayerState> emit) async {
    if (state is MusicPlaybackState) {
      final currentState = state as MusicPlaybackState<T>;
      if (currentState.currentIndex > 0) {
        await _playAtIndex(currentState.currentIndex - 1, emit);
      }
    }
  }

  Future<void> _playAtIndex(int index, Emitter<MusicPlayerState> emit) async {
    if (state is! MusicPlaybackState) return;
    final currentState = state as MusicPlaybackState<T>;

    emit(MusicPlayerLoading());
    final path = currentState.playlist[index].filePath;
    if (!_isPathValid(path, emit)) return;

    await _appPlayer.loadMediaFromRaw(path!);
    await _appPlayer.play();

    emit(currentState.copyWith(
      currentIndex: index,
      isPlaying: true,
      position: Duration.zero,
      duration: Duration.zero,
    ));
  }

  void _onCycleModeToggled(CycleModeToggled event, Emitter<MusicPlayerState> emit) {
    if (state is! MusicPlaybackState) return;
    final currentState = state as MusicPlaybackState<T>;

    switch (currentState.cycleMode) {
      case PlayBackCycleMode.sequential:
        emit(currentState.copyWith(
          cycleMode: PlayBackCycleMode.repeatOne,
          repeatMode: RepeatMode.one,
          isShuffleActive: false,
        ));
        break;
      case PlayBackCycleMode.repeatOne:
        emit(currentState.copyWith(
          cycleMode: PlayBackCycleMode.shuffle,
          repeatMode: RepeatMode.all,
          isShuffleActive: true,
        ));
        break;
      case PlayBackCycleMode.shuffle:
        emit(currentState.copyWith(
          cycleMode: PlayBackCycleMode.sequential,
          repeatMode: RepeatMode.all,
          isShuffleActive: false,
        ));
        break;
    }
  }

  Future<void> _onSeekRequested(MusicSeekRequested event, Emitter<MusicPlayerState> emit) async {
    if (state is MusicPlaybackState) {
      await _appPlayer.seekTo(event.position);
    }
  }

  @override
  Future<void> close() {
    _playbackSubscription?.cancel();
    _appPlayer.release();
    return super.close();
  }
}
