import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uira/main.dart';
import '../core_path.dart';

class AppInitializer {
  Future<void> setup() async {
    await setupHydrated();
    setupLocator();
    setupApp();
  }

  Future<void> setupHydrated() async {
    final storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
    HydratedBloc.storage = storage;
  }

  void setupLocator() {
    final locator = AppLocator();
    locator.setup();
  }

  void setupApp() {
    LoggerHelper.debug(message: 'Start Application 🎉🎉');
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppLocator.sl<ThemeCubit>()),
        ],
        child: MyApp(),
      ),
    );
  }
}