part of 'route_cubit.dart';

sealed class RouteState extends Equatable {
  final int index;
  final List<int> history;
  const RouteState({required this.index, required this.history});
}

final class RouteInitial extends RouteState {
  const RouteInitial({required super.index, required super.history});

  @override
  List<Object> get props => [index, history];
}
