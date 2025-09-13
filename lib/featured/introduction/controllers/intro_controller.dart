import '../intro_path.dart';

class IntroController {
  final AppIntro _appIntro;

  IntroController({required AppIntro appIntro}) : _appIntro = appIntro;

  String? get headline => _appIntro.headline;
  String? get description => _appIntro.description;
  String? get imagePath => _appIntro.imagePath;
  String? get titleButton => _appIntro.titleButton;
}