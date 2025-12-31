import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../audio/audio_settings_provider.dart';
import '../constants/asset_paths.dart';

/// Singleton audio manager for background graduation music
///
/// Key Technical Characteristics:
/// - Stateless Music Player: Single instance, reused for all tracks
/// - Persistent Settings: Survives app restarts via AudioSettingsProvider
/// - Error Handling: Music failures emit error state
/// - Volume Control: Independent volume for music (20%)
/// - Platform Agnostic: Uses Flutter's asset system with cross-platform support
class AudioManager {
  // Singleton instance
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  // Audio player instance (stateless, reused)
  final _player = AudioPlayer();

  // Initialization state
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Playing state
  bool get isPlaying => _player.playing;

  // Global operation lock to prevent concurrent audio operations
  bool _operationInProgress = false;

  // Volume constants
  static const double musicVolume = 0.2; // 20% volume for music

  // Callback for state changes
  void Function(AudioState state, {String? error})? onStateChanged;

  /// Initialize audio player and load graduation music
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      onStateChanged?.call(AudioState.loading);

      // Load audio asset (platform agnostic)
      await _player.setAsset(AssetPaths.graduationAudio);

      // Set loop mode for continuous playback
      await _player.setLoopMode(LoopMode.one);

      // Set volume to 20% for music
      await _player.setVolume(musicVolume);

      _isInitialized = true;
      onStateChanged?.call(AudioState.idle);
      debugPrint('AudioManager: Initialized successfully (Volume: ${(musicVolume * 100).toInt()}%)');
    } catch (e) {
      final errorMessage = 'Failed to initialize audio: $e';
      debugPrint('AudioManager: $errorMessage');
      onStateChanged?.call(AudioState.error, error: errorMessage);
    }
  }

  /// Start playing audio
  Future<void> play() async {
    // Ignore if operation in progress
    if (_operationInProgress) {
      debugPrint('AudioManager: Play ignored - operation in progress');
      return;
    }

    _operationInProgress = true;
    try {
      if (!_isInitialized) {
        await initialize();
      }

      // Don't start playing if already playing
      if (_player.playing) {
        debugPrint('AudioManager: Already playing, ignoring');
        return;
      }

      await _player.play();
      onStateChanged?.call(AudioState.playing);
      debugPrint('AudioManager: Started playing');
    } on TimeoutException catch (e) {
      debugPrint('AudioManager: Play operation timed out - $e');
      onStateChanged?.call(AudioState.error, error: 'Play timeout');
    } catch (e) {
      final errorMessage = 'Failed to play audio: $e';
      debugPrint('AudioManager: $errorMessage');
      onStateChanged?.call(AudioState.error, error: errorMessage);
    } finally {
      _operationInProgress = false;
    }
  }

  /// Pause audio
  Future<void> pause() async {
    try {
      await _player.pause();
      onStateChanged?.call(AudioState.idle);
      debugPrint('AudioManager: Paused');
    } catch (e) {
      final errorMessage = 'Failed to pause audio: $e';
      debugPrint('AudioManager: $errorMessage');
      // Silent failure for pause - don't emit error state
    }
  }

  /// Stop audio and reset position
  Future<void> stop() async {
    // Ignore if operation in progress
    if (_operationInProgress) {
      debugPrint('AudioManager: Stop ignored - operation in progress');
      return;
    }

    _operationInProgress = true;
    try {
      // Always try to stop, even if we think it's not playing
      // This ensures any lingering playback is terminated
      await _player.stop();
      await _player.seek(Duration.zero);
      onStateChanged?.call(AudioState.stopped);
      debugPrint('AudioManager: Stopped and reset');
    } catch (e) {
      final errorMessage = 'Failed to stop audio: $e';
      debugPrint('AudioManager: $errorMessage');
      // Still emit stopped state even on error
      onStateChanged?.call(AudioState.stopped);
    } finally {
      _operationInProgress = false;
    }
  }

  /// Toggle play/pause
  Future<void> togglePlayPause() async {
    // Ignore if operation already in progress
    if (_operationInProgress) {
      debugPrint('AudioManager: Operation in progress, ignoring toggle');
      return;
    }

    _operationInProgress = true;
    try {
      if (!_isInitialized) {
        await initialize();
      }

      // Check current state and toggle
      final currentlyPlaying = _player.playing;
      debugPrint('AudioManager: Current state - playing: $currentlyPlaying');

      if (currentlyPlaying) {
        // Pause and reset to beginning
        debugPrint('AudioManager: Toggling to PAUSE');
        await _player.pause();
        await _player.seek(Duration.zero);
        onStateChanged?.call(AudioState.stopped);
        debugPrint('AudioManager: Paused and reset to start');
      } else {
        // Ensure we're at the beginning and play
        debugPrint('AudioManager: Toggling to PLAY');
        // Make sure we're at the start
        await _player.seek(Duration.zero);
        await _player.play();
        onStateChanged?.call(AudioState.playing);
        debugPrint('AudioManager: Playing from start');
      }
    } catch (e) {
      final errorMessage = 'Failed to toggle audio: $e';
      debugPrint('AudioManager: $errorMessage');
      onStateChanged?.call(AudioState.error, error: errorMessage);
    } finally {
      _operationInProgress = false;
    }
  }

  /// Set volume (0.0 to 1.0)
  /// Note: Default music volume is 20%, but can be adjusted
  Future<void> setVolume(double volume) async {
    try {
      final clampedVolume = volume.clamp(0.0, 1.0);
      await _player.setVolume(clampedVolume);
      debugPrint('AudioManager: Volume set to ${(clampedVolume * 100).toInt()}%');
    } catch (e) {
      debugPrint('AudioManager: Failed to set volume - $e');
      // Silent failure for volume changes
    }
  }

  /// Get current volume
  double get volume => _player.volume;

  /// Get audio duration
  Duration? get duration => _player.duration;

  /// Get current position
  Duration get position => _player.position;

  /// Stream of player state changes
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  /// Stream of playing state changes
  Stream<bool> get playingStream => _player.playingStream;

  /// Handle app lifecycle changes
  Future<void> handleAppLifecycleChange(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        // Pause audio when app goes to background
        if (_player.playing) {
          await pause();
        }
        break;
      case AppLifecycleState.resumed:
        // Audio state is managed by persistent settings
        // User can manually restart if desired
        break;
      default:
        break;
    }
  }

  /// Dispose audio player
  Future<void> dispose() async {
    try {
      await _player.dispose();
      _isInitialized = false;
      onStateChanged?.call(AudioState.idle);
      debugPrint('AudioManager: Disposed');
    } catch (e) {
      debugPrint('AudioManager: Failed to dispose - $e');
    }
  }
}
