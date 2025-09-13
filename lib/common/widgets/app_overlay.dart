import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/core_path.dart';

class AppOverlay extends StatelessWidget {
  final SystemUiOverlayStyle? overlay;
  final Widget? child;
  const AppOverlay({super.key, this.overlay, this.child});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.themeBrightness;
    final value = overlay ?? AppLocator.sl<SystemUIController>(instanceName: 'Default').getOverlayStyle(brightness: brightness);
    return AnnotatedRegion(
      value: value,
      child: child ?? Scaffold(),
    );
  }
}

