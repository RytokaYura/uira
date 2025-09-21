import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uira/core/core_path.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final AppPlayer _appPlayer;
  StreamSubscription? _playbackSubscription;

  MusicPlayerBloc({required AppPlayer appPlayer}) : _appPlayer = appPlayer, super(MusicPlayerInitial()) {
    _playbackSubscription = _appPlayer.playbackEventStream.listen((e) {
      add(_PlayBackMusicProgressUpdated(event: e));
    });

    on<MusicNewPlayListRequested>(_onPlayNewPlaylist);
    on<MusicPauseRequested>(_onPause);
    on<MusicPlayRequested>(_onPlay);
    on<NextSongRequested>(_onNextSong);
    on<PreviousSongRequested>(_onPreviousSong);
    on<_SongCompleted>(_onSongCompleted);
    on<_PlayBackMusicProgressUpdated>(_onProgressUpdated);
    on<_ReportError>((event, emit) => emit(MusicFailure(event.message)));
    on<ShuffleToggled>(_onShuffleToggled);
    on<RepeatModeChanged>(_onRepeatModeChanged);
  }

  Future<void> _onPlayNewPlaylist(MusicNewPlayListRequested event, Emitter<MusicPlayerState> emit) async {
    emit(MusicPlayerLoading());
    final path = event.playlist[event.startIndex].filePath;

    if (!_isPathValid(path, emit)) return;

    await _appPlayer.loadMedia(path);
    await _appPlayer.play();

    emit(MusicPlaybackState(
      position: Duration.zero,
      duration: Duration.zero,
      playlist: event.playlist,
      currentIndex: event.startIndex,
      isPlaying: true,
    ));
  }

  Future<void> _onPause(MusicPauseRequested event, Emitter<MusicPlayerState> emit) async {
    await _appPlayer.pause();
    if (state is MusicPlaybackState) {
      emit((state as MusicPlaybackState).copyWith(isPlaying: false));
    }
  }

  Future<void> _onPlay(MusicPlayRequested event, Emitter<MusicPlayerState> emit) async {
    await _appPlayer.play();
    if (state is MusicPlaybackState) {
      emit((state as MusicPlaybackState).copyWith(isPlaying: true));
    }
  }

  Future<void> _onNextSong(NextSongRequested event, Emitter<MusicPlayerState> emit) async {
    if (state is MusicPlaybackState) {
      final currentState = state as MusicPlaybackState;

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
      final currentState = state as MusicPlaybackState;
      if (currentState.currentIndex > 0) {
        await _playAtIndex(currentState.currentIndex - 1, emit);
      }
    }
  }

  void _onProgressUpdated(_PlayBackMusicProgressUpdated event, Emitter<MusicPlayerState> emit) {
    if (state is MusicPlaybackState) {
      final currentState = state as MusicPlaybackState;
      if (currentState.isPlaying && event.event.position >= event.event.duration && event.event.duration > Duration.zero) {
        add(_SongCompleted());
      } else {
        emit(currentState.copyWith(position: event.event.position, duration: event.event.duration));
      }
    }
  }

  Future<void> _onSongCompleted(_SongCompleted event, Emitter<MusicPlayerState> emit) async {
    if (state is! MusicPlaybackState) return;
    final currentState = state as MusicPlaybackState;

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

  Future<void> _playAtIndex(int index, Emitter<MusicPlayerState> emit) async {
    if (state is! MusicPlaybackState) return;
    final currentState = state as MusicPlaybackState;

    emit(MusicPlayerLoading());
    final path = currentState.playlist[index].filePath;
    if (!_isPathValid(path, emit)) return;

    await _appPlayer.loadMedia(path!);
    await _appPlayer.play();

    emit(currentState.copyWith(
      currentIndex: index,
      position: Duration.zero,
      duration: Duration.zero,
      isPlaying: true,
    ));
  }

  void _onShuffleToggled(ShuffleToggled event, Emitter<MusicPlayerState> emit) {
    if (state is MusicPlaybackState) {
      final currentState = state as MusicPlaybackState;
      emit(currentState.copyWith(isShuffleActive: !currentState.isShuffleActive));
    }
  }

  void _onRepeatModeChanged(RepeatModeChanged event, Emitter<MusicPlayerState> emit) {
    if (state is MusicPlaybackState) {
      final currentState = state as MusicPlaybackState;
      int nextIndex = (currentState.repeatMode.index + 1) % RepeatMode.values.length;
      final nextMode = RepeatMode.values[nextIndex];
      emit(currentState.copyWith(repeatMode: nextMode));
    }
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

  @override
  Future<void> close() {
    _playbackSubscription?.cancel();
    _appPlayer.release();
    return super.close();
  }
}
