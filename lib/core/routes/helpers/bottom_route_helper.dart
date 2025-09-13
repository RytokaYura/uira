import 'package:go_router/go_router.dart';

import '../../core_path.dart';

class BottomRouteHelper {
  final cubit = AppLocator.sl<RouteCubit>();
  void onPop<T>({required bool didPop, required RouteState state, required StatefulNavigationShell shell, T? result}) {
    if(didPop) return;
    cubit.onBack();
    final index = getIndex();
    if(index != null) {
      LoggerHelper.info(message: 'Navigated to $index');
      shell.goBranch(index);
    }
  }

  int? getIndex() {
    return cubit.state.history.lastOrNull;
  }

  void onTap({required int index,  required StatefulNavigationShell shell,}) {
    AppLocator.sl<RouteCubit>().onPush(index);
    if(index != shell.currentIndex) {
      shell.goBranch(index);
    }
  }
}