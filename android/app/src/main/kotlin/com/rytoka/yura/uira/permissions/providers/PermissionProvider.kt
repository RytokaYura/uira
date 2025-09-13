package com.rytoka.yura.uira.permissions.providers

import com.rytoka.yura.uira.permissions.interfaces.AppPermission
import com.rytoka.yura.uira.permissions.`object`.LegacyPermission
import com.rytoka.yura.uira.permissions.`object`.TiramisuPermission

class PermissionProvider: AppPermission {
    override fun getMediaPermissions(): List<String> {
        return if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU) {
            TiramisuPermission.data
        }else {
            LegacyPermission.data
        }
    }
}