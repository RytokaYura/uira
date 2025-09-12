import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uira/core/core_path.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> with WidgetsBindingObserver{
  ThemeCubit() : super(ThemeInitial(mode: ThemeMode.system)) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ThemeState state) => state.toJson();

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    LoggerHelper.info(message: 'Brightness changed: $brightness');
    validateThemeModeSystem();
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  void validateThemeModeSystem() {
    if(state.mode == ThemeMode.system) {
      emit(ThemeInitial(mode: ThemeMode.system, time: DateTime.now()));
    }
  }

  void changedTheme(ThemeMode? mode) => emit(ThemeInitial(mode: mode ?? ThemeMode.system));
}

