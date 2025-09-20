import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/core_path.dart';
import '../../../common/common_path.dart';
import '../intro_path.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.themeBrightness;
    final overlay = AppLocator.sl<SystemUIController>(instanceName: 'Full').getOverlayStyle(brightness: brightness);
    return AppOverlay(
      overlay: overlay,
      child: Scaffold(
        body: BlocProvider(
          create: (_) => AppLocator.sl<IntroCubit>(),
          child: BlocBuilder<IntroCubit, IntroState>(
            builder: (context, state) {
              final introHelper = IntroHelper(pageController: PageController(initialPage: state.index));
              return Stack(
                fit: StackFit.expand,
                children: [

                  IntroPageBuilder(
                    introHelper: introHelper,
                  ),

                  IntroPageControl(
                    introHelper: introHelper,
                    index: state.index,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
