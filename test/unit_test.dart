import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uira/core/core_path.dart';

import 'src/core/providers/MockRouteProvider.dart';

void main() {
  late RouteController routeController;
  late MockRouteProvider mockRouteProvider;
  
  setUp(() {
    mockRouteProvider = MockRouteProvider();
    routeController = RouteController(appRoute: mockRouteProvider);
  });
  
  group('RouteController', () {
    test('getInitialRoute return home', () async {
      when(() => mockRouteProvider.getInitialRoute()).thenAnswer((_) async => '/home');
      final result = await routeController.getInitialRoute();

      expect(result, '/home');
      verify(() => mockRouteProvider.getInitialRoute()).called(1);
    });
    test('getInitialRoute return init', () async {
      when(() => mockRouteProvider.getInitialRoute()).thenAnswer((_) async => '/');
      final result = await routeController.getInitialRoute();

      expect(result, '/');
      verify(() => mockRouteProvider.getInitialRoute()).called(1);
    });
    test('getInitialRoute return error', () async {
      final exception = Exception('Failed to communicate with native');
      when(() => mockRouteProvider.getInitialRoute()).thenThrow(exception);

      expect(() => routeController.getInitialRoute(), throwsA(isA<Exception>()));
    });
  });
}
