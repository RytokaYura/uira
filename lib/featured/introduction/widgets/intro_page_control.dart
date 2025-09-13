import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:uira/core/core_path.dart';
import '../../../common/common_path.dart';
import '../intro_path.dart';

class IntroPageControl extends StatelessWidget {
  final IntroHelper? introHelper;
  final int? index;
  const IntroPageControl({super.key, this.introHelper, this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentIndex = index ?? 0;
    final pageCount = introHelper?.listPage.length ?? 4;
    void onTap() async{
      if(index == pageCount - 1) {
        final permission = await AppLocator.sl<PermissionCubit>().getMediaPermission();
        AppLocator.sl<PermissionCubit>().requestPermission(permission);
      }
      introHelper?.onNextPage(currentIndex);
    }

    return Stack(
      children: [
        AnimatedPositioned(
          top: 45.0,
          left: currentIndex == 0 ? -55.0 : 10.0,
          duration: Duration(milliseconds: 500),
          child: AppIconButton(
            onTap: () => introHelper?.onBackPage(currentIndex),
            color: theme.colorScheme.onPrimary,
          ),
        ),

        Positioned(
          left: 15.0,
          right: 0.0,
          bottom: 250.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppPageIndicator(
                controller: introHelper?.pageController,
                count: pageCount,
              ),

              if(index == pageCount -1 && context.watch<PermissionCubit>().state is PermissionGranted)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: AppIconButton(
                    onTap: () => RouteHelper().goRoute(context, AppRoutePath.home),
                    icon: PhosphorIcons.arrowRight(),
                    color: theme.colorScheme.onPrimary,
                  ),
                )
              else
                AppCardItem(
                  onTap: onTap,
                  padding: EdgeInsets.fromLTRB(50.0, 8.0, 15.0, 8.0),
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                  content: AppTitle(title: introHelper?.listPage[currentIndex].titleButton, color: theme.colorScheme.onPrimary,),
                )
            ],
          ),
        )
      ],
    );
  }
}
