import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class AppPermission {
  Future<List<Permission>> getMediaPermission(DeviceInfoPlugin plugin);
  Future<int> getSdk(DeviceInfoPlugin plugin);
}