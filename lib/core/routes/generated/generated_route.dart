import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../route_path.dart';
import '../../../featured/feature_path.dart';

class GeneratedRoute {
  static GoRouter getRouter(String initial) => GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutePath.init,
        builder: (context, state) => IntroScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => RouteScreen(shell: shell),
        branches: [
          StatefulShellBranch(
            navigatorKey: RouteKeyData().homeKey,
            routes: [
              GoRoute(
                path: AppRoutePath.home,
                name: 'home',
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: RouteKeyData().musicKey,
            routes: [
              GoRoute(
                path: AppRoutePath.music,
                name: 'music',
                builder: (context, state) => Container(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: RouteKeyData().videoKey,
            routes: [
              GoRoute(
                path: AppRoutePath.video,
                name: 'video',
                builder: (context, state) => Container(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: RouteKeyData().settingKey,
            routes: [
              GoRoute(
                path: AppRoutePath.setting,
                name: 'setting',
                builder: (context, state) => Container(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}