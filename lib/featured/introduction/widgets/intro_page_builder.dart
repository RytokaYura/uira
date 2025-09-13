import 'package:flutter/material.dart';
import '../intro_path.dart';
import '../../../common/common_path.dart';

class IntroPageBuilder extends StatelessWidget {
  final IntroHelper? introHelper;
  const IntroPageBuilder({super.key, this.introHelper});

  @override
  Widget build(BuildContext context) {
    return AppPageBuilder(
      onPageChanged: introHelper?.onPageChanged,
      controller: introHelper?.pageController,
      itemCount: introHelper?.listPage.length,
      itemBuilder: (context, index) {
        final data = introHelper?.listPage[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            IntroBackground(
              imagePath: data?.imagePath,
            ),

            IntroContent(
              headline: data?.headline,
              description: data?.description,
            ),
          ],
        );
      },
    );
  }
}
