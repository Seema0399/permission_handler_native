import android.Manifest


object PermissionUtils {
    fun parseManifestName(permission: String?): Int {
        return when (permission) {
            Manifest.permission.CAMERA -> PermissionConstants.PERMISSION_GROUP_CAMERA
            Manifest.permission.READ_CALENDAR, Manifest.permission.WRITE_CALENDAR -> PermissionConstants.PERMISSION_GROUP_CALENDAR
            Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.WRITE_EXTERNAL_STORAGE -> PermissionConstants.PERMISSION_GROUP_STORAGE

            else -> PermissionConstants.PERMISSION_GROUP_UNKNOWN
        }
    }
}