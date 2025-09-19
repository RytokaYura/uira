import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../common_path.dart';

class UiraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onTap;
  final IconData? iconData;
  const UiraAppBar({super.key, this.title, this.actions, this.onTap, this.iconData});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? 'Uira'),
      actions: actions ?? [
        AppIconButton(onTap: onTap, icon: iconData ?? PhosphorIcons.magnifyingGlass()),
        SizedBox(width: 10.0),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
