import 'package:flutter/services.dart';

abstract class SystemUI {
  SystemUiOverlayStyle getOverlayStyle({required Brightness brightness});
}