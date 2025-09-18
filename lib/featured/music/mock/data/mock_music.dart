import '../../music_path.dart';
import '../../../../common/common_path.dart';

class MockMusic {
  final List<MockMusicModel> data = [
    MockMusicModel(
      title: 'Unraveling',
      artist: ['Adrian Vance'],
      album: 'I Love You',
      genre: ['Ambient', 'Suspense'],
      duration: const Duration(minutes: 3, seconds: 45),
      release: DateTime(2025),
      cover: ImagePath.unraveling,
    ),
    MockMusicModel(
      title: 'Whispers in the Dark',
      artist: ['Eleanor Vance'],
      album: 'I Love You',
      genre: ['Dark Pop', 'Indie'],
      duration: const Duration(minutes: 2, seconds: 58),
      release: DateTime(2025),
      cover: ImagePath.whispers,
    ),
    MockMusicModel(
      title: 'Motel Room 13',
      artist: ['Adrian Vance'],
      album: 'I Love You',
      genre: ['Electronic', 'Industrial'],
      duration: const Duration(minutes: 3, seconds: 20),
      release: DateTime(2025),
      cover: ImagePath.motel,
    ),
    MockMusicModel(
      title: 'Shadows of the Past',
      artist: ['Marcus Thorne'],
      album: 'I Love You',
      genre: ['Acoustic', 'Melancholy'],
      duration: const Duration(minutes: 3, seconds: 5),
      release: DateTime(2025),
      cover: ImagePath.shadow,
    ),
    MockMusicModel(
      title: 'Echoes of the Astras',
      artist: ['A.R. Rahman', 'Lorne Balfe'],
      album: 'Arjuna',
      genre: ['Orchestral', 'Electronic Hybrid', 'World Music'],
      duration: const Duration(minutes: 4, seconds: 15),
      release: DateTime(2025),
      cover: ImagePath.echoes,
    ),
    MockMusicModel(
      title: 'Neon Dharma',
      artist: ['Lorne Balfe'],
      album: 'Arjuna',
      genre: ['Ambient', 'Synthwave', 'Cyberpunk'],
      duration: const Duration(minutes: 3, seconds: 30),
      release: DateTime(2025),
      cover: ImagePath.dharma,
    ),
  ];
}