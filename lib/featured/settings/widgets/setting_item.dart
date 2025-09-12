import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SettingItem extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? highlightColor;
  final String? title;
  final Color? colorTitle;
  final FontWeight? fontWeight;
  final bool? isDropdown;
  final IconData? icon;
  final Color? colorIcon;
  const SettingItem({super.key, this.onTap, this.highlightColor, this.title, this.colorTitle, this.fontWeight, this.isDropdown, this.icon, this.colorIcon, });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dropdown = isDropdown ?? false;
    return InkWell(
      onTap: onTap,
      highlightColor: theme.colorScheme.primary.withValues(alpha: 0.5),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title ?? 'Uira',
              style: theme.textTheme.titleLarge!.copyWith(
                color: colorTitle,
                fontWeight: fontWeight,
              ),
            ),

            if(isDropdown != null)
              Icon(dropdown ? PhosphorIcons.caretUp() : PhosphorIcons.caretDown(),
                color: dropdown ? theme.colorScheme.primary : theme.hintColor,
              ),
          ],
        ),
        leading: Icon(
          icon,
          color: colorIcon,
        ),
      ),
    );
  }
}
