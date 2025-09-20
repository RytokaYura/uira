import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../common/common_path.dart';
import '../../../core/core_path.dart';
import '../video_path.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final MockVideo mockVideo = MockVideo();

  bool isController = false;
  bool isForward = false;
  bool isRewind = false;

  int rewind = 0;
  int forward = 0;

  Timer? _hideControlsTimer;

  void visibleController(bool isVisible, VoidCallback updater,) {
    _hideControlsTimer?.cancel();

    updater();

    if(!isVisible) {
      _hideControlsTimer = Timer(const Duration(seconds: 3), () {
        updater();
      });
    }
  }

  void toForwardBackward(bool isVisible, VoidCallback updater, VoidCallback toHide) {
    _hideControlsTimer?.cancel();

    updater();

    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      toHide();
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = context.watch<ThemeCubit>().state.themeBrightness;
    final overlay = AppLocator.sl<SystemUIController>(instanceName: 'Full').getOverlayStyle(brightness: brightness);

    final background = AppLocator.sl<ColorController>().getColor(brightness: Brightness.dark).background;
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    return AppOverlay(
      overlay: overlay,
      child: Scaffold(
        backgroundColor: background,
        body: InkWell(
          onTap: () =>  visibleController(isController, () {
            setState(() {
              isController = !isController;
            });}),
          child: Stack(
            fit: StackFit.expand,
            children: [

              AspectRatio(
                aspectRatio: 16/9,
                child: AppImage(
                  fit: BoxFit.none,
                  assetPath: mockVideo.data[2].poster,
                ),
              ),

              AnimatedOpacity(
                opacity: isController ? 1.0 : 0.0,
                duration: Duration(milliseconds: 350),
                child: AppScrim(
                  color: Colors.black.withValues(alpha: .5),
                ),
              ),

              AnimatedOpacity(
                opacity: isController ? 1.0 : 0.0,
                duration: Duration(milliseconds: 350),
                child: Center(
                  child: AppIconButton(icon: PhosphorIcons.playCircle(PhosphorIconsStyle.fill), size: 42.0,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                width: MediaQuery.of(context).size.width/3.0,
                child: GestureDetector(
                  onDoubleTap: () => toForwardBackward(isRewind, () {
                    setState(() {
                      isRewind = true;
                      rewind += 10;
                    });
                  },() {
                    setState(() {
                      isRewind = false;
                      Future.delayed(Duration(milliseconds: 500), () {
                        rewind = 0;
                      });
                    });
                  }),
                  child: AnimatedOpacity(
                    opacity: isRewind ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 350),
                    child: AppCardItem(
                      color: background.withValues(alpha: .5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(MediaQuery.of(context).size.width/3.0),
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width/3.0),
                      ),
                      content: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppIconButton(icon: PhosphorIcons.rewind(PhosphorIconsStyle.fill), size: 28.0,
                              color: theme.colorScheme.onPrimary,
                            ),
                            AppDescription(title: '$rewind second',)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                width: MediaQuery.of(context).size.width/3.0,
                child: GestureDetector(
                  onDoubleTap: () => toForwardBackward(isForward, () {
                    setState(() {
                      isForward = true;
                      forward += 10;
                    });
                  },() {
                    setState(() {
                      isForward = false;
                      Future.delayed(Duration(milliseconds: 500), () {
                        forward = 0;
                      });
                    });
                  }),
                  child: AnimatedOpacity(
                    opacity: isForward ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 350),
                    child: AppCardItem(
                      color: background.withValues(alpha: .5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MediaQuery.of(context).size.width/3.0),
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width/3.0),
                      ),
                      content: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppIconButton(icon: PhosphorIcons.fastForward(PhosphorIconsStyle.fill), size: 28.0,
                              color: theme.colorScheme.onPrimary,
                            ),
                            AppDescription(title: '$forward second',)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 25.0,
                left: 10.0,
                right: 10.0,
                child: AnimatedOpacity(
                  opacity: isController ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 350),
                  child: Row(
                    spacing: 10.0,
                    children: [
                      AppIconButton(
                        onTap: () => RouteHelper().goBack(context),
                        icon: PhosphorIcons.arrowLeft(PhosphorIconsStyle.regular),
                        color: theme.colorScheme.onPrimary,
                      ),

                      Spacer(),

                      AppIconButton(
                        icon: PhosphorIcons.screencast(),
                        color: theme.colorScheme.onPrimary,
                        size: 18.0,
                      ),

                      AppIconButton(
                        icon: PhosphorIcons.queue(),
                        color: theme.colorScheme.onPrimary,
                        size: 18.0,
                      ),

                      AppIconButton(
                        icon: PhosphorIcons.share(),
                        color: theme.colorScheme.onPrimary,
                        size: 18.0,
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                right: 15.0,
                left: 15.0,
                bottom: 25.0,
                child: AnimatedOpacity(
                  opacity: isController ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 350),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppHeadline(
                        title: mockVideo.data[2].title,
                        size: 21.0,
                        color: theme.colorScheme.onPrimary,
                      ),

                      AppDescription(
                        title: mockVideo.data[2].description,
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8.0,
                        children: [
                          AppIconButton(icon: PhosphorIcons.lock(), size: 18.0,
                            color: theme.colorScheme.onPrimary,
                          ),
                          AppIconButton(icon: PhosphorIcons.deviceRotate(), size: 18.0,
                            color: theme.colorScheme.onPrimary,
                          ),

                          Spacer(),

                          AppIconButton(icon: PhosphorIcons.translate(), size: 18.0,
                            color: theme.colorScheme.onPrimary,
                          ),
                          AppIconButton(icon: PhosphorIcons.cornersIn(), size: 18.0,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ],
                      ),
                      ProgressBar(
                        progress: Duration(minutes: 36, seconds: 20),
                        total: Duration(minutes: 110,),
                        barHeight: 3.0,
                        thumbRadius: 5.0,
                        timeLabelTextStyle: theme.textTheme.titleMedium!.copyWith(
                          color: theme.hintColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
