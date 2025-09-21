import 'package:uira/core/core_path.dart';

class MockMusicModel extends BaseData{
  final String? title;
  final List<String>? artist;
  final String? album;
  final List<String>? genre;
  final DateTime? release;
  final String? cover;
  @override
  final String? filePath;

  MockMusicModel({this.title, this.artist, this.album, this.genre, this.release, this.cover, this.filePath});
}