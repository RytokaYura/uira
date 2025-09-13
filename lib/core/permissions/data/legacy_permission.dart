import 'package:permission_handler/permission_handler.dart';

import '../permission_path.dart';

class LegacyPermission implements PermissionData {
  @override
  List<Permission> get data => [Permission.storage];
}