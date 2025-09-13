import 'package:get_it/get_it.dart';
import '../../featured/feature_path.dart';
import '../../core/core_path.dart';

class AppLocator {
  static final GetIt sl = GetIt.instance;

  void setup() {
    LoggerHelper.debug(message: 'Setup App Color');
    setupColors();
    LoggerHelper.debug(message: 'Setup App Theme');
    setupThemes();
    LoggerHelper.debug(message: 'Setup App UI');
    setupSystemUI();
    LoggerHelper.debug(message: 'Setup App Intro');
    setupAppIntro();
  }

  void setupColors() {
    sl.registerLazySingleton<AppColor>(() => ColorProvider());
    sl.registerLazySingleton(() => ColorController(colorImpl: sl<AppColor>()));
  }

  void setupThemes() {
    sl.registerLazySingleton<AppTheme>(() => ThemeImpl());
    sl.registerLazySingleton<ThemeFactory>(() => ThemeFactoryImpl(appTheme: sl<AppTheme>(), colorController: sl<ColorController>()));
    sl.registerLazySingleton(() => ThemeController(themeFactory: sl<ThemeFactory>()));
    sl.registerLazySingleton(() => ThemeCubit());
  }

  void setupSystemUI() {
    sl.registerLazySingleton<SystemUI>(() => SystemUIImpl(colorController: sl<ColorController>()), instanceName: 'Default');
    sl.registerLazySingleton<SystemUI>(() => SystemUIIntroImpl(), instanceName: 'Intro');
    sl.registerLazySingleton(() => SystemUIController(systemUIImpl: sl<SystemUI>(instanceName: 'Default')), instanceName: 'Default');
    sl.registerLazySingleton(() => SystemUIController(systemUIImpl: sl<SystemUI>(instanceName: 'Intro')), instanceName: 'Intro');
  }

  void setupAppIntro() {
    sl.registerLazySingleton<AppIntro>(() => IntroFirst(), instanceName: 'First');
    sl.registerLazySingleton<AppIntro>(() => IntroSecond(), instanceName: 'Second');
    sl.registerLazySingleton<AppIntro>(() => IntroThird(), instanceName: 'Third');
    sl.registerLazySingleton<AppIntro>(() => IntroFourth(), instanceName: 'Fourth');
    sl.registerLazySingleton(() => IntroController(appIntro: sl<AppIntro>(instanceName: 'First')), instanceName: 'First');
    sl.registerLazySingleton(() => IntroController(appIntro: sl<AppIntro>(instanceName: 'Second')), instanceName: 'Second');
    sl.registerLazySingleton(() => IntroController(appIntro: sl<AppIntro>(instanceName: 'Third')), instanceName: 'Third');
    sl.registerLazySingleton(() => IntroController(appIntro: sl<AppIntro>(instanceName: 'Fourth')), instanceName: 'Fourth');
    sl.registerLazySingleton(() => IntroCubit());
  }
}