import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../setting_path.dart';
import '../../../core/core_path.dart';

class ThemeSettingHelper {
  final List<ThemeSettingModel> data;

  ThemeSettingHelper(): data = [] {
    final color = AppLocator.sl<ColorController>().getColor(
      brightness: AppLocator.sl<ThemeCubit>().state.themeBrightness,
    );
    data.addAll([
      ThemeSettingModel(
        mode: ThemeMode.system,
        label: 'Theme by system',
        icon: PhosphorIcons.palette(PhosphorIconsStyle.regular),
        activeIcon: PhosphorIcons.palette(PhosphorIconsStyle.fill),
        color: color.primary,
      ),
      ThemeSettingModel(
        mode: ThemeMode.light,
        label: 'Light Theme',
        icon: PhosphorIcons.sun(PhosphorIconsStyle.regular),
        activeIcon: PhosphorIcons.sun(PhosphorIconsStyle.fill),
        color: color.warning,
      ),
      ThemeSettingModel(
        mode: ThemeMode.dark,
        label: 'Dark Theme',
        icon: PhosphorIcons.moon(PhosphorIconsStyle.regular),
        activeIcon: PhosphorIcons.moon(PhosphorIconsStyle.fill),
        color: color.success,
      ),
    ]);
  }
}