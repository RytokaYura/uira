import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../permission_path.dart';

class PermissionController {
  final AppPermission _appPermission;

  PermissionController({required AppPermission appPermission}) : _appPermission = appPermission;

  Future<List<Permission>> getMediaPermission() async => _appPermission.getMediaPermission(DeviceInfoPlugin());
}