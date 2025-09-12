import 'package:flutter/services.dart';

import '../ui_path.dart';

class SystemUIController {
  final SystemUI _systemUIImpl;

  SystemUIController({required SystemUI systemUIImpl}) : _systemUIImpl = systemUIImpl;

  SystemUiOverlayStyle getOverlayStyle({required Brightness brightness}) => _systemUIImpl.getOverlayStyle(brightness: brightness);
}