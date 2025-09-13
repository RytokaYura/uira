import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RouteHelper {
  Future<T?> goPush<T>(BuildContext context, String path, {Object? arguments}) => context.push<T>(path, extra: arguments);
  void goRoute(BuildContext context, String path, {Object? arguments}) => context.go(path, extra: arguments);
  void goBack(BuildContext context, {Object? arguments}) => context.pop(arguments);
  void navigateToWithParams(BuildContext context, String path, {Map<String, String>? params, Object? extra}) {
    String modifiedRoute = checkParams(path, params);
    goRoute(context, modifiedRoute, arguments: extra ?? params);
  }
  static String checkParams(String path, Map<String, String>? params) {
    if (params != null) {
      params.forEach((key, value) {
        path = path.replaceFirst(':$key', value);
      });
    }
    return path;
  }
}