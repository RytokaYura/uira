part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  final ThemeMode mode;
  final DateTime _time;
  ThemeState({required this.mode, DateTime? time}): _time = time ?? DateTime.now();

  static ThemeState fromJson(Map<String, dynamic> json) {
    final theme = json['theme'] ?? 'system';
    return ThemeInitial(
      mode: ThemeMode.values.firstWhere(
        (e) => e.toString() == 'ThemeMode.$theme',
        orElse: () => ThemeMode.system,
      ),
    );
  }

  Map<String, dynamic> toJson() => {'theme': mode.toString().split('.').last};

  Brightness get themeBrightness {
    switch (mode) {
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.system:
        return WidgetsBinding.instance.platformDispatcher.platformBrightness;
    }
  }
}

final class ThemeInitial extends ThemeState {
  ThemeInitial({required super.mode, super.time});

  @override
  List<Object> get props => [mode, _time];
}
