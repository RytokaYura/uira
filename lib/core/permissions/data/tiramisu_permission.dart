import 'package:permission_handler/permission_handler.dart';

import '../permission_path.dart';

class TiramisuPermission implements PermissionData {
  @override
  List<Permission> get data => [
    Permission.photos,
    Permission.videos,
    Permission.audio,
  ];

}