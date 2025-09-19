import 'dart:math';

import 'package:flutter/material.dart';

import '../../../common/common_path.dart';
import '../video_path.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final MockVideo mockVideo = MockVideo();

  List<MockVideoModel> allVideo = [];
  List<MockVideoModel> favoriteVideo = [];

  List<bool> isLongPress = [];
  List<Map<String, dynamic>> combinedList = [];

  bool isAuto = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    allVideo = List.of(mockVideo.data)..shuffle();

    favoriteVideo = allVideo.take(min(5, mockVideo.data.length)).toList();

    isLongPress = List.filled(favoriteVideo.length, false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiraAppBar(title: 'Video', onTap: () {},),
      body: AppScrollView(
        content: [
          AppSection(title: 'Favorite'),

          const SizedBox(height: 15.0),

          AspectRatio(
            aspectRatio: 1.7,
            child: AppListBuilder(
              scrollDirection: Axis.horizontal,
              count: min(5, favoriteVideo.length),
              physics: AlwaysScrollableScrollPhysics(),
              builder: (context, index) {
                final item = favoriteVideo[index];
                if(index == min(5, favoriteVideo.length) - 1 && favoriteVideo.length > 4) {
                  return AppListAllHorizontalItem(
                    onTap: () {},
                  );
                }
                return AppListHorizontalItem(
                  padding: EdgeInsets.only(left: 10.0, right: (index == min(5, favoriteVideo.length) - 1 && favoriteVideo.length >= 4) ? 10.0 : 0.0),
                  onTap: () {},
                  title: item.title,
                  imageAsset: item.poster,
                );
              },
            ),
          ),

          const SizedBox(height: 15.0),

          AppSection(title: 'All Video'),

          AppListBuilder(
            count: allVideo.length,
            builder: (context, index) {
              final item = allVideo[index];
              return AppListVerticalItem(
                content: AppVideoItem(
                  onTap: () {},
                  imageAsset: item.poster,
                  title: item.title,
                  genre: item.genre,
                  duration: item.duration,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
