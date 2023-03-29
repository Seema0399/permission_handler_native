import 'package:flutter/material.dart';

class PermissionWithService extends GetPermission {
  const PermissionWithService._(int value) : super._(value);

  /// Creates a [PermissionWithService] instance.
  ///
  /// This constructor is marked public for testing purposes only.
  @visibleForTesting
  const PermissionWithService.private(int value) : super._(value);
}

@immutable
class GetPermission {


  const GetPermission._(this.value);

  /// Creates a [GetPermission] using the supplied integer value.
  factory GetPermission.byValue(int value) => values[value];

  /// Integer representation of the [GetPermission].
  final int value;

  /// Android: Calendar
  /// iOS: Calendar (Events)
  static const calendar = GetPermission._(0);

  /// Android: Camera
  /// iOS: Photos (Camera Roll and Camera)
  static const camera = GetPermission._(1);

  /// Android: Contacts
  /// iOS: AddressBook
  static const contacts = GetPermission._(2);

  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation (Always and WhenInUse)

  /// Returns a list of all possible [PermissionGroup] values.
  static const List<GetPermission> values = <GetPermission>[
    calendar,
    camera,
    contacts,
  ];

  static const List<String> _names = <String>[
    'calendar',
    'camera',
    'contacts',

  ];

  @override
  String toString() => 'GetPermission.${_names[value]}';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is GetPermission && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
