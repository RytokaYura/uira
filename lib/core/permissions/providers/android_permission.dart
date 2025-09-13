import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/core_path.dart';

class AndroidPermission implements AppPermission {
  @override
  Future<List<Permission>> getMediaPermission(DeviceInfoPlugin plugin) async {
    final sdk = await getSdk(plugin);
    if(sdk >= 33) {
      return AppLocator.sl<PermissionData>(instanceName: 'Tiramisu').data;
    } else {
      return AppLocator.sl<PermissionData>(instanceName: 'Legacy').data;
    }
  }

  @override
  Future<int> getSdk(DeviceInfoPlugin plugin) async {
    final info = await plugin.androidInfo;
    return info.version.sdkInt;
  }
  
}