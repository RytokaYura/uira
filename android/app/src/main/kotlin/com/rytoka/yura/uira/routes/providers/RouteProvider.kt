package com.rytoka.yura.uira.routes.providers

import android.content.Context
import android.content.pm.PackageManager
import androidx.core.content.ContextCompat
import com.rytoka.yura.uira.permissions.controllers.PermissionController
import com.rytoka.yura.uira.routes.interfaces.AppRoute

class RouteProvider(private val context: Context, private val permissionController: PermissionController): AppRoute {
    override fun getInitialRoute(): String {
        return if (hashAllMediaPermissions()) {
            "/home"
        } else {
            "/"
        }
    }

    fun hashAllMediaPermissions(): Boolean {
        return permissionController.getMediaPermissions().all {
            ContextCompat.checkSelfPermission(context, it) == PackageManager.PERMISSION_GRANTED
        }
    }
}