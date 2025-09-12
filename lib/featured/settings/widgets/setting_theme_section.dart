import 'package:flutter/material.dart';
import 'package:uira/core/core_path.dart';
import 'package:uira/common/common_path.dart';
import 'package:uira/featured/feature_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingThemeSection extends StatelessWidget {
  const SettingThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeHelper = ThemeSettingHelper();
    final themeState = context.watch<ThemeCubit>().state;
    return  AppListBuilder(
      count: themeHelper.data.length,
      builder: (context, index) {
        final item = themeHelper.data[index];
        final isMode = themeState.mode == item.mode;
        return SettingItem(
          onTap: () => context.read<ThemeCubit>().changedTheme(item.mode),
          title: item.label,
          colorTitle: isMode ? null : theme.hintColor,
          icon: isMode ? item.activeIcon : item.icon,
          colorIcon: isMode ? item.color : theme.hintColor,
          fontWeight: isMode ? null : FontWeight.normal,
        );
      },
    );
  }
}
