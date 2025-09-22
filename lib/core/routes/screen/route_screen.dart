import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uira/common/common_path.dart';
import 'package:uira/featured/feature_path.dart';
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
        return AppOverlay(
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) => bottomRouteHelper.onPop(didPop: didPop, state: state, shell: shell),
            child: Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  shell,

                  MusicPlayerBar(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: routeData.barItems,
                onTap: (index) => bottomRouteHelper.onTap(index: index, shell: shell),
                currentIndex: shell.currentIndex,
              ),
            ),
          ),
        );
      },
    );
  }
}
