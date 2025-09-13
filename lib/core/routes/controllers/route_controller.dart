import '../route_path.dart';

class RouteController {
  final AppRoute _appRoute;

  RouteController({required AppRoute appRoute}) : _appRoute = appRoute;

  Future<String> getInitialRoute() async => await _appRoute.getInitialRoute();
}