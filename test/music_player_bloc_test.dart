import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uira/core/players/models/playback_event.dart';
import 'package:uira/featured/music/bloc/music_player_bloc.dart';
import 'package:uira/featured/music/mock/data/mock_music.dart';

import 'src/core/providers/mock_player_provider.dart';

void main() {
  late MusicPlayerBloc musicPlayerBloc;
  late MockPlayerProvider mockAppPlayer;
  late StreamController<PlayBackEvent> playbackStreamController;

  final mockPlaylist = MockMusic().data;

  setUp(() {
    mockAppPlayer = MockPlayerProvider();
    playbackStreamController = StreamController<PlayBackEvent>();

    when(() => mockAppPlayer.playbackEventStream).thenAnswer((_) => playbackStreamController.stream);

    when(() => mockAppPlayer.release()).thenAnswer((_) async {});

    musicPlayerBloc = MusicPlayerBloc(appPlayer: mockAppPlayer);
  });

  tearDown(() {
    musicPlayerBloc.close();
    playbackStreamController.close();
  });

  test('initial state must be MusicPlayerInitial', () {
    expect(musicPlayerBloc.state, isA<MusicPlayerInitial>());
  });

  blocTest<MusicPlayerBloc, MusicPlayerState>(
    'should emit [MusicPlayerLoading, MusicPlaybackState] when a new playlist is played',
    setUp: () {
      when(() => mockAppPlayer.loadMediaFromRaw(any())).thenAnswer((_) async => true);
      when(() => mockAppPlayer.play()).thenAnswer((_) async {});
    },
    build: () => musicPlayerBloc,
    act: (bloc) => bloc.add(MusicNewPlayListRequested(playlist: mockPlaylist, startIndex: 0)),
    expect: () => [
      isA<MusicPlayerLoading>(),
      isA<MusicPlaybackState>(),
    ],
    verify: (_) {
      verify(() => mockAppPlayer.loadMediaFromRaw(mockPlaylist[0].filePath!)).called(1);
      verify(() => mockAppPlayer.play()).called(1);
    },
  );

  blocTest<MusicPlayerBloc, MusicPlayerState>(
    'should emit [MusicPlaybackState(isPlaying: false)] on PauseRequested event',
    seed: () => MusicPlaybackState(
      position: Duration.zero,
      duration: const Duration(minutes: 3),
      playlist: mockPlaylist,
      currentIndex: 0,
      isPlaying: true,
    ),
    setUp: () {
      when(() => mockAppPlayer.pause()).thenAnswer((_) async {});
    },
    build: () => musicPlayerBloc,
    act: (bloc) => bloc.add(MusicPauseRequested()),
    expect: () => [
      isA<MusicPlaybackState>().having((state) => state.isPlaying, 'isPlaying', false),
    ],
  );

  blocTest<MusicPlayerBloc, MusicPlayerState>(
    'must play the next song when playback stream indicates song completion',
    seed: () => MusicPlaybackState(
      position: const Duration(minutes: 2, seconds: 59),
      duration: const Duration(minutes: 3),
      playlist: mockPlaylist,
      currentIndex: 0,
      isPlaying: true,
    ),
    setUp: () {
      when(() => mockAppPlayer.loadMediaFromRaw(any())).thenAnswer((_) async => true);
      when(() => mockAppPlayer.play()).thenAnswer((_) async {});
    },
    build: () => musicPlayerBloc,
    act: (bloc) {
      playbackStreamController.add(
        PlayBackEvent(
          position: const Duration(minutes: 3),
          duration: const Duration(minutes: 3),
        ),
      );
    },
    wait: const Duration(milliseconds: 100),
    expect: () => [
      isA<MusicPlayerLoading>(),
      isA<MusicPlaybackState>().having((state) => state.currentIndex, 'currentIndex', 1),
    ],
    verify: (_) {
      verify(() => mockAppPlayer.loadMediaFromRaw(mockPlaylist[1].filePath!)).called(1);
    },
  );
}