import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uira/common/common_path.dart';
import 'package:uira/core/core_path.dart';
import 'package:uira/featured/feature_path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer().setup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = AppLocator.sl<ThemeController>();

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return AppOverlay(
          child: MaterialApp(
            title: 'Uira',
            debugShowCheckedModeBanner: false,
            theme: themeController.light,
            darkTheme: themeController.dark,
            themeMode: state.mode,
            home: const IntroScreen(),
          ),
        );
      },
    );
  }
}

