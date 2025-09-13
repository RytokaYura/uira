import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import '../../core_path.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  RouteCubit() : super(RouteInitial(index: 0, history: [0]));

  void onPush(int index) {
    if(index != state.index) {
      final newHistory = [...state.history];
      newHistory.remove(index);
      newHistory.add(index);
      LoggerHelper.info(message: 'onPush to $index, newHistory: $newHistory');
      emit(RouteInitial(index: index, history: newHistory));
    }
  }

  void onBack() {
    final newHistory = [...state.history];
    if(newHistory.length > 1) {
      newHistory.removeLast();
      final prev = newHistory.last;
      LoggerHelper.info(message: 'onBack to $prev, newHistory: $newHistory');
      emit(RouteInitial(index: prev, history: newHistory));
    } else {
      onBackHome(newHistory.last);
    }
  }

  void onBackHome(int current) {
    if(current != 0) {
      LoggerHelper.info(message: 'Force back to root index 0');
      emit(RouteInitial(index: 0, history: [0]));
    } else {
      LoggerHelper.info(message: 'Exit app from root index 0');
      SystemNavigator.pop();
    }
  }
}
