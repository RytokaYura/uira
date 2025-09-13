import 'package:flutter/material.dart';
import '../../../common/common_path.dart';

class IntroContent extends StatelessWidget {
  final String? headline;
  final String? description;
  const IntroContent({super.key, this.headline, this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: AppHeadline(title: headline ?? 'Welcome to Uira', color: theme.colorScheme.onPrimary,),
          ),

          Divider(
            thickness: 1.8,
            endIndent: 15.0,
            color: theme.hintColor.withValues(alpha: .8),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: AppDescription(title: description ?? 'Enjoy your favorite music and videos offline, anytime, anywhere.',),
          ),
        ],
      ),
    );
  }
}
