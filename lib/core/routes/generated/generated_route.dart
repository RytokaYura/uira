import 'package:go_router/go_router.dart';

import '../route_path.dart';
import '../../../featured/feature_path.dart';
import '../../../common/common_path.dart';

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
        builder: (context, state, shell) => AppOverlay(),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePath.home,
                name: 'home',
                builder: (context, state) => AppOverlay(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}