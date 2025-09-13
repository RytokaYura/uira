package com.rytoka.yura.uira.routes.controllers

import com.rytoka.yura.uira.routes.interfaces.AppRoute
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class RouteController(private val appRoute: AppRoute) {

    companion object {
        const val CHANNEL = "app/route"
        const val METHOD_GET_INITIAL_ROUTE = "getInitialRoute"
    }

    fun getInitialRoute(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == METHOD_GET_INITIAL_ROUTE) {
                result.success(appRoute.getInitialRoute())
            } else {
                result.notImplemented()
            }
        }
    }
}