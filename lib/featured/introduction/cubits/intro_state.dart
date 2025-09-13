part of 'intro_cubit.dart';

@immutable
sealed class IntroState {
  final int index;

  const IntroState({required this.index});

  static IntroState fromJson(Map<String, dynamic> json) => IntroInitial(index: json['index'] as int);

  Map<String, dynamic> toJson() => {'index': index};
}

final class IntroInitial extends IntroState {
  const IntroInitial({required super.index});
}
