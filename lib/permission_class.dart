import 'package:flutter/services.dart';

class RequestPermission {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  Future<void> addPermission(List<Permissions> permission) async {
    List<String> addedPermissions = [];
    for (int i = 0; i < permission.length; i++) {
      addedPermissions.add(permissionToString(permission[i]));
    }
    // return addedPermissions;
    try {
      final bool result = await platform
          .invokeMethod('checkPermission', {"text": addedPermissions});
    } catch (e) {
      print('Error requesting permission: $e');
      // return false;
    }
  }
}

enum Permissions {
  camera,
  readExternalStorage,
  readContacts,
  accessFineLocation,
  recordAudio,
  readCalendar,
}

String permissionToString(Permissions selectedPermission) {
  switch (selectedPermission) {
    case Permissions.camera:
      return 'camera';
    case Permissions.readExternalStorage:
      return 'readExternalStorage';
    case Permissions.readContacts:
      return 'readContacts';
    case Permissions.accessFineLocation:
      return 'accessFineLocation';
    case Permissions.recordAudio:
      return 'recordAudio';
    case Permissions.readCalendar:
      return 'readCalendar';
    default:
      return 'noaddedPermissions';
  }
}
