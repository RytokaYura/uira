import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core_path.dart';

class RouteScreen extends StatelessWidget {
  final StatefulNavigationShell shell;

  const RouteScreen({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    final BottomRouteData routeData = BottomRouteData();
    final BottomRouteHelper bottomRouteHelper = BottomRouteHelper();
    return BlocBuilder<RouteCubit, RouteState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) => bottomRouteHelper.onPop(didPop: didPop, state: state, shell: shell),
          child: Scaffold(
            body: shell,
            bottomNavigationBar: BottomNavigationBar(
              items: routeData.barItems,
              onTap: (index) => bottomRouteHelper.onTap(index: index, shell: shell),
              currentIndex: shell.currentIndex,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        );
      },
    );
  }
}
