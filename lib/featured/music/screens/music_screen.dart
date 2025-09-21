import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common_path.dart';
import '../../../core/core_path.dart';
import '../music_path.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final MockMusic mockMusic = MockMusic();

  List<MockMusicModel> allMusic = [];
  List<MockMusicModel> favoriteMusic = [];

  List<bool> isLongPress = [];
  List<Map<String, dynamic>> combinedList = [];

  @override
  void initState() {
    super.initState();
    allMusic = List.of(mockMusic.data)..shuffle();

    favoriteMusic = allMusic.take(min(5, mockMusic.data.length)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiraAppBar(
        title: 'Music',
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppSection(title: 'Favorite',),

            AppGridBuilder(
              itemCount: min(4, favoriteMusic.length),
              itemBuilder: (context, index) {
                final item = favoriteMusic[index];
                if (index == 3 && favoriteMusic.length > 4) {
                  return AppCardAll(onTap: () {},);
                }
                return AppMusicItem(
                  onTap: () {
                    context.read<MusicPlayerBloc<MockMusicModel>>().add(
                      MusicNewPlayListRequested(
                        playlist: allMusic,
                        startIndex: index,
                      ),
                    );
                    RouteHelper().goPush(context, AppRoutePath.musicPlayer);
                  },
                  title: item.title,
                  artist: item.artist,
                  imageAsset: item.cover,
                );
              },
            ),

            AppSection(title: 'All Music'),

            AppListBuilder(
              count: allMusic.length,
              builder: (context, index) {
                final item = allMusic[index];
                return AppListVerticalItem(
                  content: AppMusicItem(
                    onTap: () {
                      context.read<MusicPlayerBloc<MockMusicModel>>().add(
                        MusicNewPlayListRequested(
                          playlist: allMusic,
                          startIndex: index,
                        ),
                      );
                      RouteHelper().goPush(context, AppRoutePath.musicPlayer);
                    },
                    borderRadius: BorderRadius.zero,
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 5.0,
                    ),
                    title: item.title,
                    album: item.album,
                    artist: item.artist,
                    imageAsset: item.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
