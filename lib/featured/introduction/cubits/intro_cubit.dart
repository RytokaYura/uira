import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'intro_state.dart';

class IntroCubit extends HydratedCubit<IntroState> {
  IntroCubit() : super(IntroInitial(index: 0));

  @override
  IntroState? fromJson(Map<String, dynamic> json) => IntroState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(IntroState state) => state.toJson();

  void setIndex(int index) => emit(IntroInitial(index: index));

  void toNextPage(PageController? pageController, int pageLength) {
    if(state.index < pageLength -1) {
      pageController?.animateToPage(
        state.index + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void toPrevPage(PageController? pageController,) {
    if(state.index > 0) {
      pageController?.animateToPage(
        state.index -1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
