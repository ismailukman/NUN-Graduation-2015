import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Audio state model
enum AudioState {
  idle,
  loading,
  playing,
  stopped,
  error,
}

/// Audio settings model
class AudioSettings {
  final bool isEnabled;
  final double volume;
  final AudioState state;
  final String? errorMessage;

  const AudioSettings({
    required this.isEnabled,
    required this.volume,
    required this.state,
    this.errorMessage,
  });

  AudioSettings copyWith({
    bool? isEnabled,
    double? volume,
    AudioState? state,
    String? errorMessage,
  }) {
    return AudioSettings(
      isEnabled: isEnabled ?? this.isEnabled,
      volume: volume ?? this.volume,
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Provider for audio settings with persistence
final audioSettingsProvider =
    NotifierProvider<AudioSettingsNotifier, AudioSettings>(() {
  return AudioSettingsNotifier();
});

/// Notifier for managing audio settings with SharedPreferences persistence
class AudioSettingsNotifier extends Notifier<AudioSettings> {
  static const String _audioEnabledKey = 'audio_enabled';
  static const String _audioVolumeKey = 'audio_volume';
  static const double _defaultMusicVolume = 0.2; // 20% volume for music

  @override
  AudioSettings build() {
    _loadSettings();
    return const AudioSettings(
      isEnabled: true,
      volume: _defaultMusicVolume,
      state: AudioState.idle,
    );
  }

  /// Load saved audio preferences from SharedPreferences
  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isEnabled = prefs.getBool(_audioEnabledKey) ?? true;
      final volume = prefs.getDouble(_audioVolumeKey) ?? _defaultMusicVolume;

      state = AudioSettings(
        isEnabled: isEnabled,
        volume: volume.clamp(0.0, 1.0),
        state: AudioState.idle,
      );
    } catch (e) {
      debugPrint('Failed to load audio settings: $e');
      // Keep default settings on error
    }
  }

  /// Enable audio and persist setting
  Future<void> enableAudio() async {
    state = state.copyWith(isEnabled: true);
    await _persistEnabled(true);
  }

  /// Disable audio and persist setting
  Future<void> disableAudio() async {
    state = state.copyWith(isEnabled: false, state: AudioState.stopped);
    await _persistEnabled(false);
  }

  /// Toggle audio on/off
  Future<void> toggleAudio() async {
    if (state.isEnabled) {
      await disableAudio();
    } else {
      await enableAudio();
    }
  }

  /// Set volume (0.0 to 1.0) and persist
  Future<void> setVolume(double volume) async {
    final clampedVolume = volume.clamp(0.0, 1.0);
    state = state.copyWith(volume: clampedVolume);
    await _persistVolume(clampedVolume);
  }

  /// Update audio state
  void setState(AudioState audioState, {String? errorMessage}) {
    state = state.copyWith(
      state: audioState,
      errorMessage: errorMessage,
    );
  }

  /// Persist enabled state
  Future<void> _persistEnabled(bool enabled) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_audioEnabledKey, enabled);
    } catch (e) {
      debugPrint('Failed to save audio enabled setting: $e');
    }
  }

  /// Persist volume setting
  Future<void> _persistVolume(double volume) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_audioVolumeKey, volume);
    } catch (e) {
      debugPrint('Failed to save audio volume setting: $e');
    }
  }
}

/// Helper provider to check if audio is enabled
final isAudioEnabledProvider = Provider<bool>((ref) {
  final settings = ref.watch(audioSettingsProvider);
  return settings.isEnabled;
});

/// Helper provider to check if audio is playing
final isAudioPlayingProvider = Provider<bool>((ref) {
  final settings = ref.watch(audioSettingsProvider);
  return settings.state == AudioState.playing;
});

/// Helper provider to get current volume
final audioVolumeProvider = Provider<double>((ref) {
  final settings = ref.watch(audioSettingsProvider);
  return settings.volume;
});
