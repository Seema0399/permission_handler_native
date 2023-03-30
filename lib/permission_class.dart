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
  readCalendar,
  writeCalendar,
  readContacts,
  writeContacts,
  getAccounts,
  accessBackgroundLocation,
  accessCoarseLocation,
  accessFineLocation,
  recordAudio,
  readPhoneState,
  readPhoneNumbers,
  callPhone,
  readCallLog,
  writeCallLog,
  addVoiceMail,
  useSIP,
  bindCallRedirectionService,
  bodySensors,
  sendSMS,
  receiveSMS,
  readSMS,
  receiveWapPush,
  receiveMMS,
  readExternalStorage,
  writeExternalStorage,
  accessMediaLocation,
  activityRecognition,
  manageExternalStorage,
  systemAlertWindow,
  requestInstallPackages,
  accessNotificationPolicy,
  bluetoothScan,
  bluetoothAdvertise,
  bluetoothConnect,
  nearbyWifiDevices,
  readMediaImages,
  readMediaVideo,
  readMediaAudio,
  scheduleExactAlarm,
}

String permissionToString(Permissions selectedPermission) {
  switch (selectedPermission) {
    case Permissions.camera:
      return 'camera';
    case Permissions.readCalendar:
      return 'readCalendar';
    case Permissions.writeCalendar:
      return 'writeCalendar';
    case Permissions.readContacts:
      return 'readContacts';
    case Permissions.writeContacts:
      return 'writeContacts';
    case Permissions.getAccounts:
      return 'getAccounts';
    case Permissions.accessBackgroundLocation:
      return 'accessBackgroundLocation';
    case Permissions.accessCoarseLocation:
      return 'accessCoarseLocation';
    case Permissions.accessFineLocation:
      return 'accessFineLocation';
    case Permissions.recordAudio:
      return 'recordAudio';
    case Permissions.readPhoneState:
      return 'readPhoneState';
    case Permissions.readPhoneNumbers:
      return 'readPhoneNumbers';
    case Permissions.callPhone:
      return 'callPhone';
    case Permissions.readCallLog:
      return 'readCallLog';
    case Permissions.writeCallLog:
      return 'writeCallLog';
    case Permissions.addVoiceMail:
      return 'addVoiceMail';
    case Permissions.useSIP:
      return 'useSIP';
    case Permissions.bindCallRedirectionService:
      return 'bindCallRedirectionService';
    case Permissions.bodySensors:
      return 'bodySensors';
    case Permissions.sendSMS:
      return 'sendSMS';
    case Permissions.receiveSMS:
      return 'receiveSMS';
    case Permissions.readSMS:
      return 'readSMS';
    case Permissions.receiveWapPush:
      return 'receiveWapPush';
    case Permissions.receiveMMS:
      return 'receiveMMS';
    case Permissions.readExternalStorage:
      return 'readExternalStorage';
    case Permissions.writeExternalStorage:
      return 'writeExternalStorage';
    case Permissions.accessMediaLocation:
      return 'accessMediaLocation';
    case Permissions.activityRecognition:
      return 'activityRecognition';
    case Permissions.manageExternalStorage:
      return 'manageExternalStorage';
    case Permissions.systemAlertWindow:
      return 'systemAlertWindow';
    case Permissions.requestInstallPackages:
      return 'requestInstallPackages';
    case Permissions.accessNotificationPolicy:
      return 'accessNotificationPolicy';
    case Permissions.bluetoothScan:
      return 'bluetoothScan';
    case Permissions.bluetoothAdvertise:
      return 'bluetoothAdvertise';
    case Permissions.bluetoothConnect:
      return 'bluetoothConnect';
    case Permissions.nearbyWifiDevices:
      return 'nearbyWifiDevices';
    case Permissions.readMediaImages:
      return 'readMediaImages';
    case Permissions.readMediaVideo:
      return 'readMediaVideo';
    case Permissions.readMediaAudio:
      return 'readMediaAudio';
    case Permissions.scheduleExactAlarm:
      return 'scheduleExactAlarm';
    default:
      return 'No Added Permissions';
  }
}
