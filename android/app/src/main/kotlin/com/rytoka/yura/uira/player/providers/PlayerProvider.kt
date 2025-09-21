package com.rytoka.yura.uira.player.providers

import android.annotation.SuppressLint
import android.content.ContentResolver
import android.content.Context
import android.util.Log
import androidx.media3.exoplayer.ExoPlayer
import com.rytoka.yura.uira.player.interfaces.AppPlayer
import androidx.core.net.toUri
import androidx.media3.common.MediaItem

class PlayerProvider(private val context: Context): AppPlayer {
    private var exoPlayer: ExoPlayer? = null
    private var isReleased = false

    init {
        initialize()
    }

    private fun initialize() {
        if (exoPlayer == null) {
            exoPlayer = ExoPlayer.Builder(context).build()
            isReleased = false
        }
    }

    @SuppressLint("DiscouragedApi")
    override fun loadMediaFromRaw(fileName: String): Boolean {
        try {
            val resourceId = context.resources.getIdentifier(fileName, "raw", context.packageName)
            validateResourceID(resourceId)
            if(isReleased) initialize()
            val uri = "${ContentResolver.SCHEME_ANDROID_RESOURCE}://${context.packageName}/$resourceId".toUri()
            val mediaItem = MediaItem.fromUri(uri)
            exoPlayer?.setMediaItem(mediaItem)
            exoPlayer?.prepare()
            return true
        } catch (e: Exception) {
            Log.e("PlayerProvider", "Failed to load media: ${e.message}")
            return false
        }
    }

    private fun validateResourceID(resourceId: Int) {
        if (resourceId == 0) {
            throw IllegalArgumentException("Invalid resource ID")
        }
    }

    override fun play() {
        if(!isReleased) exoPlayer?.play()
    }

    override fun reset() {
        if(!isReleased) {
            exoPlayer?.stop()
            exoPlayer?.seekTo(0)
            exoPlayer?.prepare()
        }
    }

    override fun pause() {
        if(!isReleased) exoPlayer?.pause()
    }

    override fun stop() {
        if(!isReleased) {
            exoPlayer?.stop()
            exoPlayer?.seekTo(0)
        }
    }

    override fun release() {
        if (!isReleased) {
            exoPlayer?.release()
            exoPlayer = null
            isReleased = true
        }
    }

    override fun isPlaying(): Boolean {
        return exoPlayer?.isPlaying ?: false
    }

    override fun isReleased(): Boolean {
        return isReleased
    }

    override fun getDuration(): Long {
        return exoPlayer?.duration?.takeIf { it > 0 } ?: 0L
    }

    override fun getCurrentPosition(): Long {
        return exoPlayer?.currentPosition ?: 0L
    }

    override fun seekTo(position: Long) {
        if (!isReleased) exoPlayer?.seekTo(position)
    }

    override fun setVolume(volume: Float) {
        if (!isReleased) {
            exoPlayer?.volume = volume.coerceIn(0.0f, 1.0f)
        }
    }

}