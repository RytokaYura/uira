package com.rytoka.yura.uira.permissions.`object`

import android.Manifest
import android.os.Build
import androidx.annotation.RequiresApi
import com.rytoka.yura.uira.permissions.interfaces.PermissionData

@RequiresApi(Build.VERSION_CODES.TIRAMISU)
object TiramisuPermission : PermissionData {
    override val data: List<String>
        @RequiresApi(Build.VERSION_CODES.TIRAMISU)
        get() = listOf(
            Manifest.permission.READ_MEDIA_IMAGES,
            Manifest.permission.READ_MEDIA_VIDEO,
            Manifest.permission.READ_MEDIA_AUDIO,
        )
}