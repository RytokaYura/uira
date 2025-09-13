import 'package:flutter/services.dart';

import '../../core_path.dart';

class RouteProvider implements AppRoute {

  static const _channel = MethodChannel("app/route");

  @override
  Future<String> getInitialRoute() async {
    try {
      final result = await _channel.invokeMethod('getInitialRoute');
      return result ?? AppRoutePath.init;
    }catch (e, s) {
      LoggerHelper.error(e, s, message: 'Failed get initial route: $e');
      return AppRoutePath.init;
    }
  }

}