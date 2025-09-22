import '../../music_path.dart';
import '../../../../common/common_path.dart';

class MockMusic {
  final List<MockMusicModel> data = [
    MockMusicModel(
      id: 0.toString(),
      title: 'Unraveling',
      artist: ['Adrian Vance'],
      album: 'I Love You',
      genre: ['Ambient', 'Suspense'],
      release: DateTime(2025),
      cover: ImagePath.unraveling,
      filePath: MusicRawName.unraveling,
    ),
    MockMusicModel(
      id: 1.toString(),
      title: 'Whispers in the Dark',
      artist: ['Eleanor Vance'],
      album: 'I Love You',
      genre: ['Dark Pop', 'Indie'],
      release: DateTime(2025),
      cover: ImagePath.whispers,
      filePath: MusicRawName.whispers,
    ),
    MockMusicModel(
      id: 2.toString(),
      title: 'Motel Room 13',
      artist: ['Adrian Vance'],
      album: 'I Love You',
      genre: ['Electronic', 'Industrial'],
      release: DateTime(2025),
      cover: ImagePath.motel,
      filePath: MusicRawName.motel,
    ),
    MockMusicModel(
      id: 3.toString(),
      title: 'Shadows of the Past',
      artist: ['Marcus Thorne'],
      album: 'I Love You',
      genre: ['Acoustic', 'Melancholy'],
      release: DateTime(2025),
      cover: ImagePath.shadow,
      filePath: MusicRawName.shadows,
    ),
    MockMusicModel(
      id: 4.toString(),
      title: 'Echoes of the Astras',
      artist: ['A.R. Rahman', 'Lorne Balfe'],
      album: 'Arjuna',
      genre: ['Orchestral', 'Electronic Hybrid', 'World Music'],
      release: DateTime(2025),
      cover: ImagePath.echoes,
      filePath: MusicRawName.echoes,
    ),
    MockMusicModel(
      id: 5.toString(),
      title: 'Neon Dharma',
      artist: ['Lorne Balfe'],
      album: 'Arjuna',
      genre: ['Ambient', 'Synthwave', 'Cyberpunk'],
      release: DateTime(2025),
      cover: ImagePath.dharma,
      filePath: MusicRawName.dharma,
    ),
  ];
}