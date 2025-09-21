package com.rytoka.yura.uira

import com.rytoka.yura.uira.permissions.controllers.PermissionController
import com.rytoka.yura.uira.permissions.providers.PermissionProvider
import com.rytoka.yura.uira.player.controllers.PlayerController
import com.rytoka.yura.uira.player.providers.PlayerProvider
import com.rytoka.yura.uira.routes.controllers.RouteController
import com.rytoka.yura.uira.routes.providers.RouteProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    private var playerController: PlayerController? = null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val permissionProvider = PermissionProvider()
        val permissionController = PermissionController(permissionProvider)

        val routeProvider = RouteProvider(context, permissionController)
        val routeController = RouteController(routeProvider)

        routeController.getInitialRoute(flutterEngine)

        val playerProvider = PlayerProvider(applicationContext)
        playerController = PlayerController(playerProvider)
        playerController?.getMethodPlayer(flutterEngine)
        playerController?.getEventPlayer(flutterEngine)
    }

    override fun onDestroy() {
        playerController?.dispose()
        super.onDestroy()
    }
}
