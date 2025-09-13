import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uira/core/core_path.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  initialState();
  onPush();
  onBack();
}

void initialState() {
  group('Route Cubit', () {
    test('Initial state', () {
      expect(RouteCubit().state, RouteInitial(index: 0, history: [0]));
    });
  });
}

void onPush() {
  group('onPush', () {
    blocTest<RouteCubit, RouteState>(
      'update index and add to history index',
      build: () => RouteCubit(),
      act: (cubit) => cubit.onPush(1),
      expect: () => [
        const RouteInitial(index: 1, history: [0, 1]),
      ],
    );

    blocTest<RouteCubit, RouteState>(
      'no action if the index same of the current index',
      build: () => RouteCubit(),
      act: (cubit) => cubit.onPush(0),
      expect: () => [],
    );

    blocTest<RouteCubit, RouteState>(
      'if the index in the history remove from history and add in the last history',
      seed: () => const RouteInitial(index: 2, history: [0, 1, 2]),
      build: () => RouteCubit(),
      act: (cubit) => cubit.onPush(1),
      expect: () => [
        const RouteInitial(index: 1, history: [0, 2, 1]),
      ],
    );
  });
}

void onBack() {
  group('onBack', () {
    blocTest<RouteCubit, RouteState>(
      'go to last index and remove last',
      build: () => RouteCubit(),
      seed: () => const RouteInitial(index: 2, history: [0, 1, 2]),
      act: (cubit) => cubit.onBack(),
      expect: () => [
        const RouteInitial(index: 1, history: [0, 1]),
      ],
    );

    blocTest<RouteCubit, RouteState>(
      'go to home',
      build: () => RouteCubit(),
      seed: () => const RouteInitial(index: 2, history: [2]),
      act: (cubit) => cubit.onBack(),
      expect: () => [
        const RouteInitial(index: 0, history: [0]),
      ],
    );

    test('close application if the last history is home', () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final List<MethodCall> log = <MethodCall>[];

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform, (MethodCall methodCall) async {
          log.add(methodCall);
          return null;
        },
      );

      final cubit = RouteCubit();
      expect(cubit.state, const RouteInitial(index: 0, history: [0]));

      cubit.onBack();

      expect(log, <Matcher>[
        isMethodCall('SystemNavigator.pop', arguments: null),
      ]);

      expect(cubit.state, const RouteInitial(index: 0, history: [0]));
    });
  });
}
