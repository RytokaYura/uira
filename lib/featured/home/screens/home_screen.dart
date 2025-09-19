import 'dart:math';

import 'package:flutter/material.dart';
import '../../../common/common_path.dart';
import '../../feature_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MockVideo mockVideo = MockVideo();
  final MockMusic mockMusic = MockMusic();

  List<MockVideoModel> allVideo = [];
  List<MockMusicModel> allMusic = [];
  List<MockVideoModel> favoriteVideo = [];
  List<MockMusicModel> favoriteMusic = [];

  List<bool> isLongPress = [];
  List<Map<String, dynamic>> combinedList = [];

  bool isAuto = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    allVideo = List.of(mockVideo.data)..shuffle();
    allMusic = List.of(mockMusic.data)..shuffle();

    favoriteVideo = allVideo.take(min(4, mockVideo.data.length)).toList();
    favoriteMusic = allMusic.take(min(5, mockMusic.data.length)).toList();

    isLongPress = List.filled(favoriteVideo.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiraAppBar(onTap: () {},),
      body: AppScrollView(
        content: [
          AppSection(title: 'Favorite'),

          const SizedBox(height: 15.0),

          AppCarouselBuilder(
            itemCount: min(4, favoriteVideo.length),
            autoPlay: isAuto,
            onPageChanged: (index, reason) => setState(() => currentIndex = index),
            itemBuilder: (context, index, pageIndex) {
              final item = favoriteVideo[index];
              final isActive = index == currentIndex;
              return AppCarouselItem(
                onTap: () {},
                onStart: (_) => setState(() {
                  isLongPress[index] = true;
                  isAuto = false;
                }),
                onEnd: (_) => setState(() {
                  isLongPress[index] = false;
                  isAuto = true;
                }),
                isLargeCenter: isActive,
                isLongPress: isLongPress[index],
                title: item.title,
                imageAsset: item.poster,
                description: item.description,
              );
            },
          ),

          AppGridBuilder(
            itemCount: min(4, favoriteMusic.length),
            itemBuilder: (context, index) {
              final item = favoriteMusic[index];
              if (index == min(4, favoriteMusic.length) - 1 && favoriteMusic.length > 4) {
                return AppCardAll(onTap: () {},);
              }
              return AppMusicItem(
                onTap: () {},
                title: item.title,
                artist: item.artist,
                imageAsset: item.cover,
              );
            },
          ),

          AppSection(title: 'Latest Video'),

          const SizedBox(height: 15.0),

          AspectRatio(
            aspectRatio: 1.7,
            child: AppListBuilder(
              scrollDirection: Axis.horizontal,
              count: min(5, allVideo.length),
              physics: AlwaysScrollableScrollPhysics(),
              builder: (context, index) {
                final item = allVideo[index];
                if(index == min(5, allVideo.length) && allVideo.length > 5) {
                  return AppListAllHorizontalItem(
                    onTap: () {},
                  );
                }
                return AppListHorizontalItem(
                  padding: EdgeInsets.only(left: 10.0, right: (index == min(5, allVideo.length) - 1 && allVideo.length >= 4) ? 10.0 : 0.0),
                  onTap: () {},
                  title: item.title,
                  imageAsset: item.poster,
                );
              },
            ),
          ),

          const SizedBox(height: 15.0),

          AppSecondSection(title: 'Latest Music', toAll: () {},),

          AppListBuilder(
            count: min(10, allMusic.length),
            builder: (context, index) {
              final item = allMusic[index];
              return AppListVerticalItem(
                content: AppMusicItem(
                  onTap: () {},
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
    );
  }
}
