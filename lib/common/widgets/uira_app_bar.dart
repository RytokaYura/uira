import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:uira/core/routes/helpers/route_helper.dart';

import '../common_path.dart';

class UiraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? isBack;
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onTap;
  final IconData? iconData;
  final bool? centerTitle;
  const UiraAppBar({super.key, this.isBack, this.title, this.actions, this.onTap, this.iconData, this.centerTitle,});

  @override
  Widget build(BuildContext context) {
    final onBack = isBack ?? false;
    return AppBar(
      automaticallyImplyLeading: false,
      leading: onBack ? AppIconButton(onTap: () => RouteHelper().goBack(context), icon: PhosphorIcons.arrowLeft(PhosphorIconsStyle.regular),) : null,
      title: Text(title ?? 'Uira'),
      centerTitle: centerTitle,
      actions: actions ?? [
        AppIconButton(onTap: onTap, icon: iconData ?? PhosphorIcons.magnifyingGlass()),
        SizedBox(width: 10.0),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
