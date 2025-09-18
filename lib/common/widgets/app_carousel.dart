import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../common_path.dart';

class AppCarouselBuilder extends StatelessWidget {
  final int? itemCount;
  final bool? autoPlay;
  final bool? enlargeCenterPage;
  final double? fraction;
  final double? ratio;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final CarouselOptions? carouselOptions;
  final ExtendedIndexedWidgetBuilder? itemBuilder;

  const AppCarouselBuilder({super.key,
    this.itemCount,
    this.autoPlay,
    this.enlargeCenterPage,
    this.fraction,
    this.ratio,
    this.onPageChanged,
    this.carouselOptions,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final isAuto = autoPlay ?? true;
    final isLarge = enlargeCenterPage ?? true;
    return CarouselSlider.builder(
      itemCount: itemCount ?? 4,
      options: carouselOptions ?? CarouselOptions(
        autoPlay: isAuto,
        enlargeCenterPage: isLarge,
        viewportFraction: fraction ?? .65,
        aspectRatio: ratio ?? 2.5,
        onPageChanged: onPageChanged,
      ),
      itemBuilder: itemBuilder ?? (context, index, pageIndex) => AppCarouselItem(),
    );
  }
}

class AppCarouselItem extends StatelessWidget {
  final VoidCallback? onTap;
  final Function(LongPressStartDetails start)? onStart;
  final Function(LongPressEndDetails end)? onEnd;
  final String? imageAsset;
  final bool? isLargeCenter;
  final bool? isLongPress;
  final String? title;
  final String? description;
  const AppCarouselItem({
    super.key,
    this.onTap,
    this.onStart,
    this.onEnd,
    this.imageAsset,
    this.isLargeCenter,
    this.isLongPress,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isLarge = isLargeCenter ?? false;
    final isPress = isLongPress ?? false;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      onLongPressStart: onStart,
      onLongPressEnd: onEnd,
      child: AppCardItem(
        padding: EdgeInsets.zero,
        content: Stack(
          fit: StackFit.expand,
          children: [
            AppImage(
              borderRadius: BorderRadius.circular(8.0),
              assetPath: imageAsset ?? ImagePath.love,
            ),

            AnimatedOpacity(
              opacity: (isLarge && !isPress) ? 0.0 : 1.0,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AppScrim(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),

            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: AnimatedOpacity(
                opacity: isPress ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTitle(
                        title: title,
                      ),
                      Divider(
                        thickness: 1.5,
                        color: theme.hintColor,
                      ),
                      AppDescription(
                        title: description,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
