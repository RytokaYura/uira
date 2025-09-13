import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uira/common/common_path.dart';
import 'package:uira/core/core_path.dart';

import 'core/routes/generated/generated_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer().setup();
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final route = GeneratedRoute.getRouter(initialRoute);
    final themeController = AppLocator.sl<ThemeController>();
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return AppOverlay(
          child: MaterialApp.router(
            title: 'Uira',
            debugShowCheckedModeBanner: false,
            theme: themeController.light,
            darkTheme: themeController.dark,
            themeMode: state.mode,
            routerConfig: route,
          ),
        );
      },
    );
  }
}

