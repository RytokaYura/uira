package com.rytoka.yura.uira.player.interfaces


interface AppPlayer {
    fun loadMediaFromRaw(fileName: String): Boolean
    fun loadMediaAsset(path: String): Boolean
    fun play()
    fun reset()
    fun pause()
    fun stop()
    fun release()
    fun isPlaying(): Boolean
    fun isReleased(): Boolean
    fun getDuration(): Long
    fun getCurrentPosition(): Long
    fun seekTo(position: Long)
    fun setVolume(volume: Float)
}