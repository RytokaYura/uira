import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../common/common_path.dart';


class MusicSection extends StatelessWidget {
  final VoidCallback? onFavorite;
  final String? title;
  final List<String>? artist;
  final VoidCallback? onTimer;
  const MusicSection({super.key, this.onFavorite, this.title, this.artist, this.onTimer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        spacing: 15.0,
        children: [
          AppIconButton(onTap: onFavorite, icon: PhosphorIcons.heart(), color: theme.hintColor,),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 5.0,
                children: [
                  AppTitle(
                    title: title,
                  ),

                  AppDescription(
                    title: artist?.join(' · '),
                    size: 14.0,
                  ),
                ],
              ),
            ),
          ),
          AppIconButton(onTap: onTimer, icon: PhosphorIcons.timer(), color: theme.hintColor,),
        ],
      ),
    );
  }
}
