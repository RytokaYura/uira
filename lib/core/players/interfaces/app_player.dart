import '../player_path.dart';

abstract class AppPlayer {
  Stream<PlayBackEvent> get playbackEventStream;
  Future<bool> loadMediaFromRaw(String filename);
  Future<bool> loadMediaAsset(String path);
  Future<void> play();
  Future<void> reset();
  Future<void> pause();
  Future<void> stop();
  Future<void> release();
  Future<bool> isPlaying();
  Future<bool> isReleased();
  Future<Duration> getDuration();
  Future<Duration> getCurrentPosition();
  Future<void> seekTo(Duration position);
  Future<void> setVolume(double volume);
}