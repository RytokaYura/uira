import 'package:flutter/material.dart';
import '../../../common/common_path.dart';

class IntroBackground extends StatelessWidget {
  final String? imagePath;
  const IntroBackground({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppImage(
          assetPath: imagePath,
        ),
        AppScrim(),
      ],
    );
  }
}
