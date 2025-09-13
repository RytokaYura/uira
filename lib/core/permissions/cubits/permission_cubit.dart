import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/core_path.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionInitial());

  Future<List<Permission>> getMediaPermission() async {
    if(Platform.isAndroid) {
      return await AppLocator.sl<PermissionController>(instanceName: 'Android').getMediaPermission();
    }
    return <Permission>[];
  }

  Future<Map<Permission, PermissionStatus>> _getStatues(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> result = {};
    for (var permission in permissions) {
      result[permission] = await permission.status;
    }
    return result;
  }

  Future<void> checkPermission(List<Permission> permissions) async {
    final statues = await _getStatues(permissions);
    if(statues.values.every((s) => s.isGranted)) {
      emit(PermissionGranted());
    } else if(statues.values.any((s) => s.isPermanentlyDenied)) {
      emit(PermissionPermanentlyDenied());
    } else {
      emit(PermissionDenied());
    }
  }

  Future<void> requestPermission(List<Permission> permissions) async {
    final statuses = await permissions.request();

    if (statuses.values.every((s) => s.isGranted)) {
      emit(PermissionGranted());
    } else if (statuses.values.any((s) => s.isPermanentlyDenied)) {
      emit(PermissionPermanentlyDenied());
    } else {
      emit(PermissionDenied());
    }
  }
}
