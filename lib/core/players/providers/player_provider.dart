import 'package:flutter/services.dart';

import '../player_path.dart';

class PlayerProvider implements AppPlayer {

  static const _channel = MethodChannel('app/player/methods');
  static const _events = EventChannel('app/player/events');

  @override
  Stream<PlayBackEvent> get playbackEventStream {
    return _events.receiveBroadcastStream().map((e) {
      final int position = e['position'] ?? 0;
      final int duration = e['duration'] ?? 0;
      return PlayBackEvent(
        position: Duration(milliseconds: position),
        duration: Duration(milliseconds: duration)
      );
    });
  }

  @override
  Future<Duration> getCurrentPosition() async => Duration(milliseconds: await _channel.invokeMethod('getCurrentPosition') ?? 0);

  @override
  Future<Duration> getDuration() async => Duration(milliseconds: await _channel.invokeMethod('getDuration') ?? 0);

  @override
  Future<bool> isPlaying() async => await _channel.invokeMethod('isPlaying') ?? false;

  @override
  Future<bool> isReleased() async => await _channel.invokeMethod('isReleased') ?? false;

  @override
  Future<bool> loadMedia(String filename) async => await _channel.invokeMethod<bool>('loadMediaFromRaw', {'fileName': filename,}) ?? false;

  @override
  Future<void> pause() async => await _channel.invokeMethod('pause');

  @override
  Future<void> play() async => await _channel.invokeMethod('play');

  @override
  Future<void> release() async => await _channel.invokeMethod('release');

  @override
  Future<void> reset() async => await _channel.invokeMethod('reset');

  @override
  Future<void> seekTo(Duration position) async => await _channel.invokeMethod('seekTo', {'position': position.inMilliseconds});

  @override
  Future<void> setVolume(double volume) async => await _channel.invokeMethod('setVolume', {'volume': volume});

  @override
  Future<void> stop() async => await _channel.invokeMethod('stop');

}