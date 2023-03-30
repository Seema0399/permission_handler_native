package com.example.permission_handler

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.provider.Settings
import android.widget.Toast
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"

    var selectedPermissions = mutableListOf<String>()
    val PERMISSION_REQUEST_CODE = 123

    fun permissionType(permission: String): String {
        var permissions = ""
        when (permission) {
            "camera" -> permissions = Manifest.permission.CAMERA
            "readCalendar" -> permissions = Manifest.permission.READ_CALENDAR
            "writeCalendar" -> permissions = Manifest.permission.WRITE_CALENDAR
            "readContacts" -> permissions = Manifest.permission.READ_CONTACTS
            "writeContacts" -> permissions = Manifest.permission.WRITE_CONTACTS
            "getAccounts" -> permissions = Manifest.permission.GET_ACCOUNTS
            "accessBackgroundLocation" -> permissions =
                Manifest.permission.ACCESS_BACKGROUND_LOCATION
            "accessCoarseLocation" -> permissions = Manifest.permission.ACCESS_COARSE_LOCATION
            "accessFineLocation" -> permissions = Manifest.permission.ACCESS_FINE_LOCATION
            "recordAudio" -> permissions = Manifest.permission.RECORD_AUDIO
            "readPhoneState" -> permissions = Manifest.permission.READ_PHONE_STATE
            "readPhoneNumbers" -> permissions = Manifest.permission.READ_PHONE_NUMBERS
            "callPhone" -> permissions = Manifest.permission.CALL_PHONE
            "readCallLog" -> permissions = Manifest.permission.READ_CALL_LOG
            "writeCallLog" -> permissions = Manifest.permission.WRITE_CALL_LOG
            "addVoiceMail" -> permissions = Manifest.permission.ADD_VOICEMAIL
            "useSIP" -> permissions = Manifest.permission.USE_SIP
            "bindCallRedirectionService" -> permissions =
                Manifest.permission.BIND_CALL_REDIRECTION_SERVICE
            "bodySensors" -> permissions = Manifest.permission.BODY_SENSORS
            "sendSMS" -> permissions = Manifest.permission.SEND_SMS
            "receiveSMS" -> permissions = Manifest.permission.RECEIVE_SMS
            "readSMS" -> permissions = Manifest.permission.READ_SMS
            "receiveWapPush" -> permissions = Manifest.permission.RECEIVE_WAP_PUSH
            "receiveMMS" -> permissions = Manifest.permission.RECEIVE_MMS
            "readExternalStorage" -> permissions = Manifest.permission.READ_EXTERNAL_STORAGE
            "writeExternalStorage" -> permissions = Manifest.permission.WRITE_EXTERNAL_STORAGE
            "accessMediaLocation" -> permissions = Manifest.permission.ACCESS_MEDIA_LOCATION
            "activityRecognition" -> permissions = Manifest.permission.ACTIVITY_RECOGNITION
            "manageExternalStorage" -> permissions = Manifest.permission.MANAGE_EXTERNAL_STORAGE
            "systemAlertWindow" -> permissions = Manifest.permission.SYSTEM_ALERT_WINDOW
            "requestInstallPackages" -> permissions = Manifest.permission.REQUEST_INSTALL_PACKAGES
            "accessNotificationPolicy" -> permissions =
                Manifest.permission.ACCESS_NOTIFICATION_POLICY
            "bluetoothScan" -> permissions = Manifest.permission.BLUETOOTH_SCAN
            "bluetoothAdvertise" -> permissions = Manifest.permission.BLUETOOTH_ADVERTISE
            "bluetoothConnect" -> permissions = Manifest.permission.BLUETOOTH_CONNECT
            "nearbyWifiDevices" -> permissions = Manifest.permission.NEARBY_WIFI_DEVICES
            "readMediaImages" -> permissions = Manifest.permission.READ_MEDIA_IMAGES
            "readMediaVideo" -> permissions = Manifest.permission.READ_MEDIA_VIDEO
            "readMediaAudio" -> permissions = Manifest.permission.READ_MEDIA_AUDIO
            "scheduleExactAlarm" -> permissions = Manifest.permission.SCHEDULE_EXACT_ALARM
        }
        return permissions
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL).setMethodCallHandler { call, result ->
            var checkPermissions = call.argument<ArrayList<String>>("text")
            if (call.method == "checkPermission") {
                print(checkPermissions)
                for (i in checkPermissions!!.indices) {
                    var permissionFromList = permissionType(checkPermissions[i])
                    selectedPermissions.add(permissionFromList)

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        requestPermissions(selectedPermissions.toTypedArray(),
                            PERMISSION_REQUEST_CODE)
                        print(selectedPermissions)
                    }
                }
            } else {
                result.notImplemented()
            }
        }
    }


    // handle permission request result
    override fun onRequestPermissionsResult(
        requestCode: Int, permissions: Array<String>, grantResults: IntArray,
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        if (requestCode == PERMISSION_REQUEST_CODE) {
            for (i in permissions.indices) {
                if (grantResults.isNotEmpty() && grantResults[i] == PackageManager.PERMISSION_GRANTED
                ) {
                    // Permission granted, do something
                    Toast.makeText(context, "Permission Granted", Toast.LENGTH_SHORT).show()
                    selectedPermissions.removeAt(i)
                } else {
                    if (grantResults.isNotEmpty() && grantResults[i] == PackageManager.PERMISSION_DENIED) {
                        if (ActivityCompat.shouldShowRequestPermissionRationale(this,
                                permissions[i])
                        ) {
                            Toast.makeText(this, "Permission Denied", Toast.LENGTH_SHORT).show()
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                                requestPermissions(selectedPermissions.toTypedArray(),
                                    PERMISSION_REQUEST_CODE)
                            }
                        } else {
                            // Show an explanation to the user
                            // and request for permissions again
                            alertDialog()
                        }
                    }
                }
            }
        } else {
            Toast.makeText(context, "Permission Denied", Toast.LENGTH_SHORT).show()
        }

    }

    //    go to settings
    private fun goToSettings() {
        val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
            Uri.fromParts("package", packageName, null))
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        startActivity(intent)
    }

    private fun alertDialog() {
        val alertDialogBuilder = android.app.AlertDialog.Builder(this)
        alertDialogBuilder.setTitle("Permissions Required")
            .setMessage("You have forcefully denied some of the required permissions " + "for this action. Please open settings, go to permissions and allow them.")
            .setPositiveButton("Settings") { dialog, which -> goToSettings() }
            .setNegativeButton("Cancel") { dialog, which -> finish() }
            .setCancelable(false).create().show()
    }
}
