package com.rytoka.yura.uira.player.controllers

import android.os.Handler
import android.os.Looper
import com.rytoka.yura.uira.player.interfaces.AppPlayer
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class PlayerController(private val appPlayer: AppPlayer) {
    private val handler = Handler(Looper.getMainLooper())
    private lateinit var runnable: Runnable
    companion object {
        const val METHOD = "app/player/methods"
        const val EVENT = "app/player/events"
    }

    fun getMethodPlayer(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD).setMethodCallHandler { call, result ->
            when (call.method) {
                "loadMediaFromRaw" -> {
                    val fileName = call.argument<String>("fileName") ?: ""
                    val success = loadMediaFromRaw(fileName)
                    result.success(success)
                }
                "loadMediaFromAsset" -> {
                    val assetPath = call.argument<String>("assetPath")
                    if (assetPath == null) {
                        result.error("INVALID_ARGUMENT", "assetPath is null", null)
                        return@setMethodCallHandler
                    }
                    val success = appPlayer.loadMediaAsset(assetPath)
                    result.success(success)
                }
                "play" -> { play(); result.success(null) }
                "reset" -> { reset(); result.success(null) }
                "pause" -> { pause(); result.success(null) }
                "stop" -> { stop(); result.success(null) }
                "release" -> { release(); result.success(null) }
                "isPlaying" -> {
                    result.success(isPlaying())
                }
                "isReleased" -> {
                    result.success(isReleased())
                }
                "getDuration" -> {
                    result.success(getDuration())
                }
                "getCurrentPosition" -> {
                    result.success(getCurrentPosition())
                }
                "seekTo" -> {
                    val position = call.argument<Int>("position")?.toLong() ?: 0L
                    seekTo(position)
                    result.success(null)
                }
                "setVolume" -> {
                    val volume = call.argument<Double>("volume")?.toFloat() ?: 1.0f
                    setVolume(volume)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    fun getEventPlayer(flutterEngine: FlutterEngine) {
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    runnable = object : Runnable {
                        override fun run() {
                            if (!appPlayer.isReleased()) {
                                val playbackData = mapOf(
                                    "position" to appPlayer.getCurrentPosition(),
                                    "duration" to appPlayer.getDuration()
                                )
                                events?.success(playbackData)
                            }
                            handler.postDelayed(this, 250)
                        }
                    }
                    handler.post(runnable)
                }

                override fun onCancel(arguments: Any?) {
                    handler.removeCallbacks(runnable)
                }
            }
        )
    }

    fun dispose() {
        handler.removeCallbacks(runnable)
        appPlayer.release()
    }

    fun loadMediaFromRaw(fileName: String): Boolean {
        return appPlayer.loadMediaFromRaw(fileName)
    }

    fun play() {
        appPlayer.play()
    }

    fun reset() {
        appPlayer.reset()
    }

    fun pause() {
        appPlayer.pause()
    }

    fun stop() {
        appPlayer.stop()
    }

    fun release() {
        appPlayer.release()
    }

    fun isPlaying(): Boolean {
        return appPlayer.isPlaying()
    }

    fun isReleased(): Boolean {
        return appPlayer.isReleased()
    }

    fun getDuration(): Long {
        return appPlayer.getDuration()
    }

    fun getCurrentPosition(): Long {
        return appPlayer.getCurrentPosition()
    }

    fun seekTo(position: Long) {
        appPlayer.seekTo(position)
    }

    fun setVolume(volume: Float) {
        appPlayer.setVolume(volume)
    }
}