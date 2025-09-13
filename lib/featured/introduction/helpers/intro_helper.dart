import 'package:flutter/cupertino.dart';

import '../intro_path.dart';
import '../../../core/core_path.dart';

class IntroHelper {
  final PageController pageController;
  final List<IntroController> listPage = [];

  IntroHelper({required this.pageController}){
    listPage.addAll([
      AppLocator.sl<IntroController>(instanceName: 'First'),
      AppLocator.sl<IntroController>(instanceName: 'Second'),
      AppLocator.sl<IntroController>(instanceName: 'Third'),
      AppLocator.sl<IntroController>(instanceName: 'Fourth'),
    ]);
  }

  void onPageChanged(int index) => AppLocator.sl<IntroCubit>().setIndex(index);
  void onNextPage(int index) => AppLocator.sl<IntroCubit>().toNextPage(pageController, listPage.length);
  void onBackPage(int index) => AppLocator.sl<IntroCubit>().toPrevPage(pageController);

}