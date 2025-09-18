import 'package:flutter/material.dart';

import 'app_text.dart';

class AppSection extends StatelessWidget {
  final String? title;
  const AppSection({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: AppTitle(
            title: title,
          ),
        ),

        Divider(
          thickness: 1.8,
          endIndent: 15.0,
        ),
      ],
    );
  }
}

class AppSecondSection extends StatelessWidget {
  final String? title;
  final VoidCallback? toAll;
  const AppSecondSection({super.key, this.title, this.toAll});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 10.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTitle(
                title: title,
              ),

              InkWell(
                onTap: toAll,
                borderRadius: BorderRadius.circular(5.0),
                highlightColor: theme.hintColor.withValues(alpha: .2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: AppDescription(title: 'See all',),
                ),
              ),
            ],
          ),
        ),

        Divider(
          thickness: 1.8,
          endIndent: 15.0,
        )
      ],
    );
  }
}
