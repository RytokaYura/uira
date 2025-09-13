package com.rytoka.yura.uira.permissions.controllers

import com.rytoka.yura.uira.permissions.interfaces.AppPermission

class PermissionController(private val appPermission: AppPermission) {
    fun getMediaPermissions(): List<String> {
        return appPermission.getMediaPermissions()
    }
}