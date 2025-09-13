import 'package:flutter/material.dart';
import '../../../common/common_path.dart';
import '../intro_path.dart';

class IntroPageControl extends StatelessWidget {
  final IntroHelper? introHelper;
  final int? index;
  const IntroPageControl({super.key, this.introHelper, this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentIndex = index ?? 0;
    return Stack(
      children: [
        AnimatedPositioned(
          top: 45.0,
          left: currentIndex == 0 ? -55.0 : 10.0,
          duration: Duration(milliseconds: 500),
          child: AppIconButton(
            onTap: () => introHelper?.onBackPage(currentIndex),
            color: theme.colorScheme.onPrimary,
          ),
        ),

        Positioned(
          left: 15.0,
          right: 0.0,
          bottom: 250.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppPageIndicator(
                controller: introHelper?.pageController,
                count: introHelper?.listPage.length,
              ),

              AppCardItem(
                onTap: () => introHelper?.onNextPage(currentIndex),
                padding: EdgeInsets.fromLTRB(50.0, 8.0, 15.0, 8.0),
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                content: AppTitle(title: introHelper?.listPage[currentIndex].titleButton, color: theme.colorScheme.onPrimary,),
              ),
            ],
          ),
        )
      ],
    );
  }
}
