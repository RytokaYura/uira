package com.rytoka.yura.uira.permissions.`object`

import com.rytoka.yura.uira.permissions.interfaces.PermissionData

object LegacyPermission: PermissionData {
    override val data: List<String>
        get() = listOf(
            android.Manifest.permission.READ_EXTERNAL_STORAGE,
        )
}