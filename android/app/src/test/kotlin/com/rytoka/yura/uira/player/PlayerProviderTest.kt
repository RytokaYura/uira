package com.rytoka.yura.uira.player

import android.content.Context
import android.content.res.Resources
import com.rytoka.yura.uira.player.interfaces.AppPlayer
import com.rytoka.yura.uira.player.providers.PlayerProvider
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import org.mockito.kotlin.any
import org.mockito.kotlin.whenever

class PlayerProviderTest {

    @Mock
    private lateinit var mockContext: Context

    @Mock
    private lateinit var mockResources: Resources

    private var playerProvider: AppPlayer? = null

    @BeforeEach
    fun setUp() {
        MockitoAnnotations.openMocks(this)

        whenever(mockContext.resources).thenReturn(mockResources)
        whenever(mockContext.packageName).thenReturn("com.rytoka.yura.uira")

        playerProvider = PlayerProvider(mockContext)
    }

    @Nested
    @DisplayName("Initial State")
    inner class InitialState {
        @Test
        fun `player should not be released upon creation`() {
            assertFalse(playerProvider!!.isReleased(), "Player should not be in a released state upon creation.")
        }

        @Test
        fun `isPlaying should be false initially`() {
            assertFalse(playerProvider!!.isPlaying(), "Player should not be playing upon creation.")
        }
    }

    @Nested
    @DisplayName("Core Behavior")
    inner class CoreBehavior {
        @Test
        fun `loadMediaFromRaw with invalid file name should return false`() {
            whenever(mockResources.getIdentifier(any(), any(), any())).thenReturn(0)

            val success = playerProvider!!.loadMediaFromRaw("non_existent_file")
            assertFalse(success, "Loading a non-existent file should return false.")
        }

        @Test
        fun `release should update isReleased state to true`() {
            playerProvider!!.release()
            assertTrue(playerProvider!!.isReleased(), "isReleased should be true after release() is called.")
        }
    }
}


