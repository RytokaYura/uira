part of 'permission_cubit.dart';

@immutable
sealed class PermissionState {}

final class PermissionInitial extends PermissionState {}
final class PermissionGranted extends PermissionState {}
final class PermissionDenied extends PermissionState {}
final class PermissionPermanentlyDenied extends PermissionState {}

